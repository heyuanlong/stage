ifstream::ifstream(重载了  >> )
ofstream::ofstream（重载了  << ）
fstream::fstream（重载了  << 和 >> ）
(三个类的成员函数基本一样)
	void close();
	bool is_open();//Returns whether the stream is currently associated to a file.
	void open (const char* filename,  ios_base::openmode mode = ios_base::in);
	ifstream::operator=
	ifstream::rdbuf
	ifstream::swap



// swapping ifstream objects
#include <iostream>     // std::cout
#include <fstream>      // std::ifstream
int main () {
  std::ifstream foo;
  std::ifstream bar ("test.txt");
  foo.swap(bar);
  char c = foo.get();
  while (foo.good()) {
    std::cout << c;
    c = foo.get();
  }
  foo.close();
  return 0;
}





// ofstream::open / ofstream::close
#include <fstream>      // std::ofstream
int main () {
  std::ofstream ofs;
  ofs.open ("test.txt", std::ofstream::out | std::ofstream::app);
  ofs << " more lorem ipsum";
  ofs.close();
  return 0;
}





















