
## 关于mdwiki
此博客的搭建用的为[mdwiki](https://github.com/Dynalon/mdwiki/)。
 
使用 [mdwiki](https://github.com/Dynalon/mdwiki/) 可以轻松的搭建个人轻博客、知识库、或文档中心等。
搭建博客时，只需要把markdown文件和mdwiki程序（html+js）部署在一个Web Server上，利用前端技术，在访问md文件时即时解析并渲染成HTML。


### 实现原理
mdwiki的所有逻辑的实现都放在index.html中，当请求首页时比如请求www.test.com/index.html
代码中会自动在请求url之后添加`#!index.md`,添加后的url的形式如下
www.test.com/index.html#!index.md
之后再根据`#!`之后的内容进行ajax请求服务器上的markdown的内容，请求回来之后再把markdown的内容渲染成html网页。

网页中的url也会被替换成以`#!`开头，当请求时程序会解析`#!`之后的url，并ajax请求相应的内容并解析。

### URL 中的 `#!` 是什么意思？
URL 中的 # 本来的用途是跳转到页内锚点，一个 URL 中 `#` 后的值 (hash tag) 不影响所访问网页的内容，所以搜索引擎在处理仅仅 hash tag 不同的多个 URL 时会当做相同内容从而忽略 hash tag。
但近年来 hash tag 越来越多地被用于 AJAX 请求获取数据，不同 hash tag 对应的网页内容也有所不同，为了有效地区别这种情况和过去传统的页内锚点标示，让搜索引擎更好地抓取 AJAX 数据，Google 提出的解决方案 (似乎是在 2009 年) 是用 `#!` (被称为 hashbang ) 来进行区分，他们将带有 `#!` 的 URL 称为 pretty AJAX URL。当网页爬虫遇到这样的 URL 就会将带不同 hash tag 的 URL 当做不同内容来进行抓取，从而获得更全的信息。



### 用mdwiki搭建的博客示例
- https://github.com/liminany/m

## 关于本博客
记录日常的学习笔记、技术笔记、读书笔记，分享自己的所见所思所得。
点击查看[文章列表](index.md)

## 本博客仓库目录结构
```
blog_mdwiki
├── batch_mod_file_suffix.sh    # 批量修改指定目录下的文件名,可以递归的修改
├── blog                        # 所有博客都在此目录下
├── change_img_url.sh           # 批量修改博客中的图片链接的shell脚本
├── config.json
├── index.html                  # mdwiki源码
├── index.md                    # 博客首页
├── md_file_tree.py             # 生成当前文件中的所有markdown文件列表的工具
├── md-to-toc.py                # 生成markdown的toc的工具
├── navigation.md               # blog中的导航栏
├── web.config

```

## 关于我
俺是一个非科班出身的程序员。大学学的市场营销，带着对技术的兴趣，自学了多半年的编程。15年初和另一个好友来到北京，住着五道口的地下室吃着泡面就开始了北漂生活。狂投了几天简历，狂面了几天试，找到了一份web开发的工作，于是就开始了俺的程序员的生涯。先后搞过web前后端、游戏服务器和客户端、区块链等，技术更侧重服务器方向。
写这个blog一来是督促自己有点输出，分享一下自己了解的一点东西。二来希望结识些志趣相投的朋友。
以下是俺的联系方式
* Mail: sunxvming@163.com
* [github](https://github.com/sunxvming)：https://github.com/sunxvming