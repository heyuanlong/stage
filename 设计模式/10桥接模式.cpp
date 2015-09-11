桥接模式的实现。
       [DP]书上定义：将抽象部分与它的实现部分分离，使它们都可以独立地变化。考虑装操作系统，有多种配置的计算机，同样也有多款操作系统。如何运用桥接模式呢？可以将操作系统和计算机分别抽象出来，让它们各自发展，减少它们的耦合度。当然了，两者之间有标准的接口。这样设计，不论是对于计算机，还是操作系统都是非常有利的。下面给出这种设计的UML图，其实就是桥接模式的UML图。

         给出C++的一种实现：
[cpp] view plaincopyprint?
//操作系统  
class OS  
{  
public:  
    virtual void InstallOS_Imp() {}  
};  
class WindowOS: public OS  
{  
public:  
    void InstallOS_Imp() { cout<<"安装Window操作系统"<<endl; }   
};  
class LinuxOS: public OS  
{  
public:  
    void InstallOS_Imp() { cout<<"安装Linux操作系统"<<endl; }   
};  
class UnixOS: public OS  
{  
public:  
    void InstallOS_Imp() { cout<<"安装Unix操作系统"<<endl; }   
};  
//计算机  
class Computer  
{  
public:  
    virtual void InstallOS(OS *os) {}  
};  
class DellComputer: public Computer  
{  
public:  
    void InstallOS(OS *os) { os->InstallOS_Imp(); }  
};  
class AppleComputer: public Computer  
{  
public:  
    void InstallOS(OS *os) { os->InstallOS_Imp(); }  
};  
class HPComputer: public Computer  
{  
public:  
    void InstallOS(OS *os) { os->InstallOS_Imp(); }  
};  
        客户使用方式：
[css] view plaincopyprint?
int main()  
{  
    OS *os1 = new WindowOS();  
    OS *os2 = new LinuxOS();  
    Computer *computer1 = new AppleComputer();  
    computer1->InstallOS(os1);  
    computer1->InstallOS(os2);  
}  