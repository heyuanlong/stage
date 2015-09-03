std::getline (string)
C++98C++11
(1)	
istream& getline (istream& is, string& str, char delim);//If the delimiter is found, it is extracted and discarded, i.e. it is not stored and the next input operation will begin after it.简而言之，不放入delim，下次查找时还会跳过它。
(2)	
istream& getline (istream& is, string& str);



template <class E, class T = char_traits<E> >
    class basic_ios : public ios_base {
public:
    typedef E char_type;
    typedef T::int_type int_type;
    typedef T::pos_type pos_type;
    typedef T::off_type off_type;
    explicit basic_ios(basic_streambuf<E, T>* sb);
    virtual ~basic_ios();
    operator void *() const;
    bool operator!() const;
    iostate rdstate() const;
    void clear(iostate state = goodbit);
    void setstate(iostate state);
    bool good() const;                    //如果流状态为goodbit，则返回true​
    bool eof() const;					 //如果eofbit被置位，则返回true​
    bool fail() const;					//如果failbit或者badbit被置位，则返回true​
    bool bad() const;				   //如果badbit被置位，则返回true​
    iostate exceptions() const;
    iostate exceptions(iostate except);
    basic_ios& copyfmt(const basic_ios& rhs);
    E fill() const;
    E fill(E ch);
    basic_ostream<E, T> *tie() const;
    basic_ostream<E, T> *tie(basic_ostream<E, T> *str);
    basic_streambuf<E, T> *rdbuf() const;
    basic_streambuf<E, T> *rdbuf(basic_streambuf<E, T> *sb);
    basic_ios& copyfmt(const basic_ios& rhs);
    locale imbue(const locale& loc);
    E widen(char ch);
    char narrow(E ch, char dflt);
protected:
    basic_ios();
    void init(basic_streambuf<E, T>* sb);
    };



class basic_istream : virtual public basic_ios<E, T> {
public:


istream：
member functions:
istream::gcount        //返回最后一次非格式化读操作读取的字符数。
istream::get
istream::getline
istream::ignore       //忽略输入流中的一个字符。​   其实是移动了流指针，可用unget返回。
istream::operator>>
istream::peek         //返回下一个要读取的字符，但是并不真正读取。​  没有移动流指针。
istream::putback      //和unget()类似，但是putback会在读取操作发生之前检查，参数c是否是最后一个读入的字符。
istream& read (char* s, streamsize n);        //EOF (exception)​
streamsize readsome (char* s, streamsize n);     //EOF (no exception)​
istream::seekg     //设置流指针
istream::sync
istream::tellg     //获取流指针位置
istream::unget     //将流指针回退一格
non-member overloads:
operator>> (istream)
protected members:
istream::operator=
istream::swap


std::istream::get

int get();
istream& get (char& c);
istream& get (char* s, streamsize n);
istream& get (char* s, streamsize n, char delim);
istream& get (streambuf& sb);
istream& get (streambuf& sb, char delim);  //(t or EOF) (excluding)

istream& getline (char* s, streamsize n );
istream& getline (char* s, streamsize n, char delim ); //t or EOF (including)​



