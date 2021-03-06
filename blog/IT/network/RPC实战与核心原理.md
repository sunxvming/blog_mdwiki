## 开篇词 | 别老想着怎么用好RPC框架，你得多花时间琢磨原理
只要涉及到网络通信，我们就可能用到 RPC
在我看来，RPC 是解决分布式系统通信问题的一大利器。
这个系列的文章是有java代码讲解的。


## 01 | 核心原理：能否画张图解释下RPC的通信流程？
我理解的 RPC 是帮助我们屏蔽网络编程细节，实现调用远程方法就跟调用本地（同一个项
目中的方法）一样的体验，我们不需要因为这个方法是远程调用就需要编写很多与业务无关 的代码。
我认为，RPC 的作用就是体现在这样两个方面：
屏蔽远程调用跟本地调用的区别，让我们感觉就是调用项目内的方法；
隐藏底层网络通信的复杂性，让我们更专注于业务逻辑

围绕 RPC 我们讲了这么多，那 RPC 在架构中究竟处于什么位置呢？
如刚才所讲，RPC 是解决应用间通信的一种方式，而无论是在一个大型的分布式应用系统
还是中小型系统中，应用架构最终都会从“单体”演进成“微服务化”，整个应用系统会被
拆分为多个不同功能的应用，并将它们部署在不同的服务器中，而应用之间会通过 RPC 进
行通信，可以说 RPC 对应的是整个分布式应用系统，就像是“经络”一样的存在。


RPC 框架能够帮助我们解决系统拆分后的通信问题，并且能让我们像调用本地一样去调用
远程方法。利用 RPC 我们不仅可以很方便地将应用架构从“单体”演进成“微服务化”，
而且还能解决实际开发过程中的效率低下、系统耦合等问题，这样可以使得我们的系统架构
整体清晰、健壮，应用可运维度增强。


适用场景：和服务器的交互比较多的情况
## 02 | 协议：怎么设计可扩展且向后兼容的协议？
这还要从 RPC 的作用说起，相对于 HTTP 的用处，RPC 更多的是负责应用间的通信，所以 性能要求相对更高。
### 那怎么设计一个私有 RPC 协议呢？
在协议头里面，我们除了会放协议长度、序列化方式，还会放一些像协议标示、消息 ID、
消息类型这样的参数，而协议体一般只放请求接口方法、请求的业务参数值和一些扩展属
性。这样一个完整的 RPC 协议大概就出来了，协议头是由一堆固定的长度参数组成，而协
议体是根据请求接口和参数构造的，长度属于可变的，具体协议如下图所示：



可扩展的协议：
刚才讲的协议属于定长协议头，那也就是说往后就不能再往协议头里加新参数了，如果加参
数就会导致线上兼容问题。
决绝方法就是消息头也是长度可变。

设计一个简单的 RPC 协议并不难，难的就是怎么去设计一个可“升级”的
协议。不仅要让我们在扩展新特性的时候能做到向下兼容，而且要尽可能地减少资源损耗，
所以我们协议的结构不仅要支持协议体的扩展，还要做到协议头也能扩展。


## 03 | 序列化：对象怎么在网络中传输？
### 有哪些常用的序列化？
* JDK 原生序列化
实际上任何一种序列化框架，核心思想就是设计一种序列化协议，将对象的类型、属性类
型、属性值一一按照固定的格式写到二进制字节流中来完成序列化，再按照固定的格式一一
读出对象的类型、属性类型、属性值，通过这些信息重新创建出一个新的对象，来完成反序 列化。
* JSON
JSON 进行序列化的额外空间开销比较大，对于大数据量服务这意味着需要巨大的内存
和磁盘开销；
JSON 没有类型，但像 Java 这种强类型语言，需要通过反射统一解决，所以性能不会太
好
* Protobuf


### RPC 框架中如何选择序列化？
序列化与反序列化过程是 RPC 调用的一个必须过程，那么序列化与反序列化的性能、效率、和序列化后的大小
势必将直接关系到 RPC 框架整体的性能和效率。


## 04 | 网络通信：RPC框架在网络通信上更倾向于哪种网络IO模型？
### 常见的网络 IO 模型
那说到网络通信，就不得不提一下网络 IO 模型。为什么要讲网络 IO 模型呢？因为所谓的
两台 PC 机之间的网络通信，实际上就是两台 PC 机对网络 IO 的操作。
常见的网络 IO 模型分为四种：同步阻塞 IO（BIO）、同步非阻塞 IO（NIO）、IO 多路复
用和异步非阻塞 IO（AIO）。在这四种 IO 模型中，只有 AIO 为异步 IO，其他都是同步 IO


RPC 调用在大多数的情况下，是一个高并发调用的场景，考虑到系统内核的支持、编程语
言的支持以及 IO 模型本身的特点，在 RPC 框架的实现中，在网络通信的处理上，我们会
选择 IO 多路复用的方式。开发语言的网络通信框架的选型上，我们最优的选择是基于
Reactor 模式实现的框架，如 Java 语言，首选的框架便是 Netty 框架（Java 还有很多其
他 NIO 框架，但目前 Netty 应用得最为广泛），并且在 Linux 环境下，也要开启 epoll 来
提升系统性能（Windows 环境下是无法开启 epoll 的，因为系统内核不支持）。


### 什么是零拷贝？

应用进程的每一次写操作，都会把数据写到用户空间的缓冲区中，再由 CPU 将数据拷贝到
系统内核的缓冲区中，之后再由 DMA 将这份数据拷贝到网卡中，最后由网卡发送出去。
这里我们可以看到，一次写操作数据要拷贝两次才能通过网卡发送出去，而用户进程的读操
作则是将整个流程反过来，数据同样会拷贝两次才能让应用程序读取到数据。


那怎么做到零拷贝？你想一下是不是用户空间与内核空间都将数据写到一个地方，就不需要
拷贝了？此时你有没有想到虚拟内存？
零拷贝有两种解决方式，分别是 mmap+write 方式和 sendfile 方式，其核心原理都是
通过虚拟内存来解决的。





## 05 | 动态代理：面向接口编程，屏蔽RPC处理流程


## 06 | RPC实战：剖析gRPC源码，动手实现一个完整的RPC

