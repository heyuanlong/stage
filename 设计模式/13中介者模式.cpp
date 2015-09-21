中介者模式的实现。
       中介者模式：用一个中介对象来封装一系列的对象交互。中介者使各对象不需要显式地相互引用，从而使其耦合松散，而且可以独立地改变它们之间的交互。中介者模式的例子很多，大到联合国安理会，小到房屋中介，都扮演了中间者的角色，协调各方利益。
       本文就以租房为例子，如果没有房屋中介，那么房客要自己找房东，而房东也要自己找房客，非常不方便。有了房屋中介机构就方便了，房东可以把要出租的房屋信息放到中介机构，而房客可以去中介机构咨询。在软件中，就是多个对象之间需要通信，如果没有中介，对象就需要知道其他对象，最坏情况下，可能需要知道所有其他对象，而有了中介对象就方便多了，对象只需与中介对象通信，而不用知道其他的对象。这就是中介者模式，下面以租房为例，给出中介者模式的UML图。

        实现不难，下面给出C++的实现：
[cpp] view plaincopyprint?
class Mediator;  
//抽象人  
class Person  
{  
protected:  
    Mediator *m_mediator; //中介  
public:  
    virtual void SetMediator(Mediator *mediator){} //设置中介  
    virtual void SendMessage(string message) {}    //向中介发送信息  
    virtual void GetMessage(string message) {}     //从中介获取信息  
};  
//抽象中介机构  
class Mediator  
{  
public:  
    virtual void Send(string message, Person *person) {}  
    virtual void SetA(Person *A) {}  //设置其中一方  
    virtual void SetB(Person *B) {}  
};  
//租房者  
class Renter: public Person  
{  
public:  
    void SetMediator(Mediator *mediator) { m_mediator = mediator; }  
    void SendMessage(string message) { m_mediator->Send(message, this); }  
    void GetMessage(string message) { cout<<"租房者收到信息"<<message; }  
};  
//房东  
class Landlord: public Person  
{  
public:  
    void SetMediator(Mediator *mediator) { m_mediator = mediator; }  
    void SendMessage(string message) { m_mediator->Send(message, this); }  
    void GetMessage(string message) { cout<<"房东收到信息："<<message; }  
};  
//房屋中介  
class HouseMediator : public Mediator  
{  
private:  
    Person *m_A; //租房者  
    Person *m_B; //房东  
public:  
    HouseMediator(): m_A(0), m_B(0) {}  
    void SetA(Person *A) { m_A = A; }  
    void SetB(Person *B) { m_B = B; }  
    void Send(string message, Person *person)   
    {  
        if(person == m_A) //租房者给房东发信息  
            m_B->GetMessage(message); //房东收到信息  
        else  
            m_A->GetMessage(message);  
    }  
};  
        客户使用方式如下：
[cpp] view plaincopyprint?
//测试案例  
int main()  
{     
    Mediator *mediator = new HouseMediator();  
    Person *person1 = new Renter();    //租房者  
    Person *person2 = new Landlord();  //房东  
    mediator->SetA(person1);  
    mediator->SetB(person2);  
    person1->SetMediator(mediator);  
    person2->SetMediator(mediator);  
    person1->SendMessage("我想在南京路附近租套房子，价格800元一个月\n");  
    person2->SendMessage("出租房子：南京路100号，70平米，1000元一个月\n");  
    delete person1; delete person2; delete mediator;  
    return 0;  
}  
        本人享有博客文章的版权，转载请标明出处 http://blog.csdn.net/wuzhekai1985
