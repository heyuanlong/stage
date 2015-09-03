istringstream（重载了  >>  ）
ostringstream（重载了  <<  ）
stringstream（重载了  << 和 >> ）
(三个类的成员函数基本一样)
	istringstream::operator=
	istringstream::rdbuf  //std::stringbuf *pbuf = iss.rdbuf();
	string str() const;			//returns a string object with a copy of the current contents of the stream.
	void str (const string& s);  // sets str as the contents of the stream
	istringstream::swap          // foo.swap(bar);  交换



// istringstream::str
#include <string>       // std::string
#include <iostream>     // std::cout
#include <sstream>      // std::istringstream

int main () {
  std::istringstream iss;
  std::string strvalues = "32 240 2 1450";
  iss.str (strvalues);
  for (int n=0; n<4; n++)
  {
    int val;
    iss >> val;
    std::cout << val << '\n';
  }
  std::cout << "Finished writing the numbers in: ";
  std::cout << iss.str() << '\n';
  return 0;
}
/*
32
240
2
1450
Finished writing the numbers in: 32 240 2 1450
*/



// ostringstream::rdbuf
#include <string>       // std::string
#include <iostream>     // std::cout
#include <sstream>      // std::ostringstream
int main () {
  std::ostringstream oss;
  oss << "One hundred and one: " << 101;
  std::string s = oss.str();
  std::cout << s << '\n';
  return 0;
}
//One hundred and one: 101
















