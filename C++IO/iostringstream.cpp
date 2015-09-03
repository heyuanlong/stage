istringstream（重载了  >>  ）
	istringstream::operator=
	istringstream::rdbuf  //std::stringbuf *pbuf = iss.rdbuf();
	string str() const;			//returns a string object with a copy of the current contents of the stream.
	void str (const string& s);  // sets str as the contents of the stream
	istringstream::swap          // foo.swap(bar);  交换



ostringstream（重载了  <<  ）
	istringstream::operator=
	istringstream::rdbuf  //std::stringbuf *pbuf = iss.rdbuf();
	string str() const;			//returns a string object with a copy of the current contents of the stream.
	void str (const string& s);  // sets str as the contents of the stream
	istringstream::swap          // foo.swap(bar);  交换


stringstream（重载了  << 和 >> ）
	istringstream::operator=
	istringstream::rdbuf  //std::stringbuf *pbuf = iss.rdbuf();
	string str() const;			//returns a string object with a copy of the current contents of the stream.
	void str (const string& s);  // sets str as the contents of the stream
	istringstream::swap          // foo.swap(bar);  交换






















