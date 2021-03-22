## Pimpl
Pimpl是“pointer to implementation”的缩写，意为指向实现的指针。Pimpl是针对C++的设计模式，它将所有的私有数据成员、私有成员函数隔离到一个.cpp文件中独立实现的类或结构体内，在.h中仅需要包含指向该类实例的不透明指针（opaque pointer）即可。
好处：1.接口和实现完全分离 2.修改实现文件，使用的地方不用重新编译
```
class AutoTimer
{
public:
    explicit AutoTimer(const std::string &name);
    ~AutoTimer();
private:
    class Impl;
    Impl *pmImpl;
};
```