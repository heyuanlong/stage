
单例模式的实现。
      单例的一般实现比较简单，下面是代码和UML图。由于构造函数是私有的，因此无法通过构造函数实例化，唯一的方法就是通过调用静态函数GetInstance。
      UML图：

      代码：
[cpp] view plaincopyprint?
//Singleton.h  
class Singleton    
{  
public:  
    static Singleton* GetInstance();  
private:  
    Singleton() {}  
    static Singleton *singleton;  
};  
//Singleton.cpp  
Singleton* Singleton::singleton = NULL;  
Singleton* Singleton::GetInstance()  
{  
    if(singleton == NULL)  
        singleton = new Singleton();  
    return singleton;  
}  
       这里只有一个类，如何实现Singleton类的子类呢？也就说Singleton有很多子类，在一种应用中，只选择其中的一个。最容易就是在GetInstance函数中做判断，比如可以传递一个字符串，根据字符串的内容创建相应的子类实例。这也是DP书上的一种解法，书上给的代码不全。这里重新实现了一下，发现不是想象中的那么简单，最后实现的版本看上去很怪异。在VS2008下测试通过。
[cpp] view plaincopyprint?
//Singleton.h  
#pragma once  
#include <iostream>  
using namespace std;  
  
class Singleton    
{  
public:  
    static Singleton* GetInstance(const char* name);  
    virtual void Show() {}  
protected: //必须为保护，如果是私有属性，子类无法访问父类的构造函数  
    Singleton() {}  
private:  
    static Singleton *singleton; //唯一实例的指针  
};  
  
//Singleton.cpp  
#include "Singleton.h"  
#include "SingletonA.h"  
#include "SingletonB.h"  
Singleton* Singleton::singleton = NULL;  
Singleton* Singleton::GetInstance(const char* name)  
{  
    if(singleton == NULL)  
    {  
        if(strcmp(name, "SingletonA") == 0)  
            singleton = new SingletonA();  
        else if(strcmp(name,"SingletonB") == 0)  
            singleton = new SingletonB();  
        else   
            singleton = new Singleton();  
    }  
    return singleton;  
}  
[cpp] view plaincopyprint?
//SingletonA.h  
#pragma once  
#include "Singleton.h"  
class SingletonA: public Singleton  
{  
    friend class Singleton; //必须为友元类，否则父类无法访问子类的构造函数  
public:  
    void Show() { cout<<"SingletonA"<<endl; }  
private:   //为保护属性，这样外界无法通过构造函数进行实例化  
    SingletonA() {}   
};  
//SingletonB.h  
#pragma once  
#include "Singleton.h"  
class SingletonB: public Singleton  
{  
    friend class Singleton; //必须为友元类，否则父类无法访问子类的构造函数  
public:  
    void Show(){ cout<<"SingletonB"<<endl; }  
private:  //为保护属性，这样外界无法通过构造函数进行实例化  
    SingletonB() {}  
};  
[cpp] view plaincopyprint?
#include "Singleton.h"  
int main()  
{  
    Singleton *st = Singleton::GetInstance("SingletonA");  
    st->Show();  
    return 0;  
}  
       上面代码有一个地方很诡异，父类为子类的友元，如果不是友元，函数GetInstance会报错，意思就是无法调用SingletonA和SIngletonB的构造函数。父类中调用子类的构造函数，我还是第一次碰到。当然了把SingletonA和SIngletonB的属性设为public，GetInstance函数就不会报错了，但是这样外界就可以定义这些类的对象，违反了单例模式。
       看似奇怪，其实也容易解释。在父类中构建子类的对象，相当于是外界调用子类的构造函数，因此当子类构造函数的属性为私有或保护时，父类无法访问。为共有时，外界就可以访问子类的构造函数了，此时父类当然也能访问了。只不过为了保证单例模式，所以子类的构造函数不能为共有，但是又希望在父类中构造子类的对象，即需要调用子类的构造函数，这里没有办法才出此下策：将父类声明为子类的友元类。
      本人享有博客文章的版权，转载请标明出处 http://blog.csdn.net/wuzhekai1985

版权声明：本文为博主原创文章，未经博主允许不得转载。