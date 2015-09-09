template <class E, class T = char_traits<E> >
    class basic_ostream {
public:
    class sentry;
    explicit basic_ostream(basic_streambuf<E, T> *sb);
    virtual ~ostream();
    bool opfx();
    void osfx();
    basic_ostream& operator<<;
    basic_ostream& put(E c);				//Inserts character c into the stream.
    basic_ostream& write(E *s, streamsize n);//把字符串s的n个字符写到ostream对象里
    basic_ostream& flush();                 //输出缓存
    pos_type tellp();						//获取流指针的位置
    basic_ostream& seekp(pos_type pos);   //设置流指针的位置
    basic_ostream& seekp(off_type off, ios_base::seek_dir way);
    };



// Copy a file
#include <fstream>      // std::ifstream, std::ofstream
int main () {
  std::ifstream infile ("test.txt",std::ifstream::binary);
  std::ofstream outfile ("new.txt",std::ofstream::binary);
  // get size of file
  infile.seekg (0,infile.end);
  long size = infile.tellg();
  infile.seekg (0);
  // allocate memory for file content
  char* buffer = new char[size];
  // read content of infile
  infile.read (buffer,size);
  // write to outfile
  outfile.write (buffer,size);
  // release dynamically-allocated memory
  delete[] buffer;
  outfile.close();
  infile.close();
  return 0;
}


// typewriter
#include <iostream>     // std::cin, std::cout
#include <fstream>      // std::ofstream
int main () {
  std::ofstream outfile ("test.txt");
  char ch;
  std::cout << "Type some text (type a dot to finish):\n";
  do {
    ch = std::cin.get();
    outfile.put(ch);
  } while (ch!='.');
  return 0;
}