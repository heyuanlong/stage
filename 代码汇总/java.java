
加载配置
static {
    InputStream in = Client.class.getClassLoader().getResourceAsStream("api.cfg.properties");
    Properties properties = new Properties();
    try {
    properties.load(in);
    UC_API = properties.getProperty("UC_API");
    UC_IP = properties.getProperty("UC_IP");
  } catch (Exception e) {
    e.printStackTrace();
  }
}


import org.json.*;
JSONObject jsobjcet = new JSONObject();

public class HelloWorld {
    public static void main(String []args) {
        System.out.println("Hello World"); // 打印 Hello World
    }
}


枚举
class FreshJuice {
   enum FreshJuiceSize{ SMALL, MEDUIM, LARGE }
   FreshJuiceSize size;
}

public class FreshJuiceTest {
   public static void main(String []args){
      FreshJuice juice = new FreshJuice();
      juice.size = FreshJuice. FreshJuiceSize.MEDUIM ;
   }
}

构造方法
public class Puppy{
   public Puppy(){
   }

   public Puppy(String name){
      // 这个构造器仅有一个参数：name
   }
}

一个源文件中只能有一个public类
一个源文件可以有多个非public类

所有包中都声明了异常类和所有错误类。Exception类是所有异常类的父类；Eror类是所有错误类的父类。这两个类同时又是Throwable的子类


要实现对象的序列化，这个对象所属的类型必须实现Serializable接口。
class Book implements Serializable    //创建Book类，并声明其实现Serializable接口
{
	int id;
	String name;
	String author;
	float price;
	public Book(int id,String name,String author,float price)
	{
	this.id=id;
	this.name=name;
	this.author=author;
	this.price=price;
	}
}


二维数组的输入输出
for(int i=0;i<arr.length;++i)
	for(int j=0;j<arr[i].length;++j)
	{
		arr[i][j]=2;
	}
for(int i=0;i<arr.length;++i)
	for(int j=0;j<arr[i].length;++j)
	{
		System.out.print(arr[i][j]);
	}
for(int row[]:arr)
	for(int col:row)
	{
		System.out.print(col);
	}

int nums[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
   for(int x : nums) {
     System.out.print(x + " ");
     x = x * 10; // no effect on nums
   }

抽象象：
abstract class Fruit{
    public String color;
    public Fruit(){
        color="red";
    }
    public abstract void harvest();
}

成员内部类
public class Outer {
    public static void main(String[] args) {
        Outer outer = new Outer();
        Outer.Inner inner = outer.new Inner();
        inner.print("Outer.new");

        inner = outer.getInner();
        inner.print("Outer.get");
    }
    public class Inner {
        public void print(String str) {
            System.out.println(str);
        }
    }
}


获取某一个类所对应的Class对象可以通过如下三种途径：
1，Object的getClass方法
Date date1 = new Date();
Class c1 = date1.getClass();
System.out.println(c1.getName()); // java.util.Date

2，使用.class的方式
使用类名加“.class”的方式即会返回与该类对应的Class对象。例如：
Class clazz = String.class;
System.out.println(clazz.getName()); // java.lang.String

3，使用Class.forName方法
Class有一个著名的static方法forName：
Class clazz = Class.forName("org.whatisjava.reflect.Foo");

Class onwClass = Class.forName("org.test.GetClass");
现在我们有了一个Class类的实例了。下面就是获取一个Object类的实例对象。
Object o = onwClass.newInstance();
现在我们已经有了一个Object对象，下一步就可以对这个Object进行强制转换了。


java常用的集合类
ArrayList  LinkedList
HashSet   TreeSet
HashMap   TreeMap

java 遍历arrayList的四种方法
//方法1
 Iterator it1 = list.iterator();
 while(it1.hasNext()){
     System.out.println(it1.next());
 }
 //方法2
 for(Iterator it2 = list.iterator();it2.hasNext();){
      System.out.println(it2.next());
 }
 //方法3
 for(String tmp:list){
     System.out.println(tmp);
 }
 //方法4
 for(int i = 0;i < list.size(); i ++){
     System.out.println(list.get(i));
 }

可以使用
try...catch
try...catch...finally
try...finally


 声明异常和抛出异常
 public void setID(String id) throws IllegalException{
    throw new IllegalArgumentException("参数长度应为7");
}
throw new Exception("抛出异常");

自定义异常
1.自定义异常:
class 异常类名 extends Exception
{
    public 异常类名(String msg)
    {
        super(msg);
    }
}


java多线程
http://blog.csdn.net/aboy123/article/details/38307539



jdbc
package com.test.jdbc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * @author Administrator
 * 模板类DBUtils
 */
public final class DBUtils {
    // 参数定义
    private static String url = "jdbc:mysql://localhost:3306/mytest"; // 数据库地址
    private static String username = "root"; // 数据库用户名
    private static String password = "root"; // 数据库密码

    private DBUtils() {

    }
    // 加载驱动
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("驱动加载出错!");
        }
    }

    // 获得连接
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    // 释放连接
    public static void free(ResultSet rs, Statement st, Connection conn) {
        try {
            if (rs != null) {
                rs.close(); // 关闭结果集
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (st != null) {
                    st.close(); // 关闭Statement
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (conn != null) {
                        conn.close(); // 关闭连接
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }

        }

    }
}

try {
            conn = DBUtils.getConnection();
            st = conn.createStatement();
            String sql = "select * from users where lastname = '" + name + "'"; // 主要注入发生地
            System.out.println("sql: " + sql); // 打印SQL语句
            rs = st.executeQuery(sql);
            System.out.println("age\tlastname\tfirstname\tid");
            while (rs.next()) {
                System.out.println(rs.getInt(1) + "\t" + rs.getString(2)
                        + "\t\t" + rs.getString(3) + "\t\t" + rs.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.free(rs, st, conn);
        }

try {
            conn = DBUtils.getConnection();
            String sql = "select * from users where lastname = ?"; // 这里用问号
            st = conn.prepareStatement(sql);
            st.setString(1,name); // 这里将问号赋值
            rs = st.executeQuery();
            System.out.println("age\tlastname\tfirstname\tid");
            while (rs.next()) {
                System.out.println(rs.getInt(1) + "\t" + rs.getString(2)
                        + "\t\t" + rs.getString(3) + "\t\t" + rs.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.free(rs, st, conn);
        }
