template<class E,
    class T = char_traits<E>,
    class A = allocator<T> >
    class basic_string {
public:
    static const size_type npos = -1;
    explicit basic_string(const A& al = A());
    basic_string(const basic_string& rhs);
    basic_string(const basic_string& rhs, size_type pos, size_type n,//其他string的pos位置的n个字符
        const A& al = A());
    basic_string(const E *s, size_type n, const A& al = A());//s开始的n个字符
    basic_string(const E *s, const A& al = A());
    basic_string(size_type n, E c, const A& al = A());//n个字符c
    basic_string(const_iterator first, const_iterator last,
        const A& al = A());
    basic_string& operator=(const basic_string& rhs);
    basic_string& operator=(const E *s);
    basic_string& operator=(E c);//一个字符
    iterator begin();
    const_iterator begin() const;
    iterator end();
    const_iterator end() const;
    reverse_iterator rbegin();
    const_reverse_iterator rbegin() const;
    reverse_iterator rend();
    const_reverse_iterator rend() const;
    const_reference at(size_type pos) const;
    reference at(size_type pos);
    const_reference operator[](size_type pos) const;
    reference operator[](size_type pos);
    const E *c_str() const;//返回c风格字符串
    const E *data() const;
    size_type length() const;//返回长度
    size_type size() const;//同上
    size_type max_size() const;
    void resize(size_type n, E c = E());//重新设置容器的元素个数
    size_type capacity() const;//设置容器的容量
    void reserve(size_type n = 0);//将字符串的容量设置为至少size
    bool empty() const;
    basic_string& operator+=(const basic_string& rhs);
    basic_string& operator+=(const E *s);
    basic_string& operator+=(E c);
    basic_string& append(const basic_string& str);
    basic_string& append(const basic_string& str,
        size_type pos, size_type n);//追加str的pos位置开始的n个字符
    basic_string& append(const E *s, size_type n);//追加str开始的n个字符
    basic_string& append(const E *s);
    basic_string& append(size_type n, E c);//追加n个字符c
    basic_string& append(const_iterator first, const_iterator last);
    basic_string& assign(const basic_string& str);
    basic_string& assign(const basic_string& str,
        size_type pos, size_type n);//重置为str的pos位置开始的n个字符
    basic_string& assign(const E *s, size_type n);
    basic_string& assign(const E *s);
    basic_string& assign(size_type n, E c);
    basic_string& assign(const_iterator first, const_iterator last);
    basic_string& insert(size_type p0,
        const basic_string& str);//在p0前面插入str字符串
    basic_string& insert(size_type p0,
        const basic_string& str, size_type pos, size_type n);//在p0前面插入str的pos位置开始的n个字符
    basic_string& insert(size_type p0,
        const E *s, size_type n);
    basic_string& insert(size_type p0, const E *s);
    basic_string& insert(size_type p0, size_type n, E c);
    iterator insert(iterator it, E c);
    void insert(iterator it, size_type n, E c);
    void insert(iterator it,
        const_iterator first, const_iterator last);
    basic_string& erase(size_type p0 = 0, size_type n = npos);///删除p0开始的n个字符
    iterator erase(iterator it);
    iterator erase(iterator first, iterator last);
    basic_string& replace(size_type p0, size_type n0,
        const basic_string& str);//用str替换p0开始的n0个字符
    basic_string& replace(size_type p0, size_type n0,
        const basic_string& str, size_type pos, size_type n);
    basic_string& replace(size_type p0, size_type n0,
        const E *s, size_type n);
    basic_string& replace(size_type p0, size_type n0,
        const E *s);
    basic_string& replace(size_type p0, size_type n0,
        size_type n, E c);
    basic_string& replace(iterator first0, iterator last0,
        const basic_string& str);
    basic_string& replace(iterator first0, iterator last0,
        const E *s, size_type n);
    basic_string& replace(iterator first0, iterator last0,
        const E *s);
    basic_string& replace(iterator first0, iterator last0,
        size_type n, E c);
    basic_string& replace(iterator first0, iterator last0,
        const_iterator first, const_iterator last);//区间替换
    size_type copy(E *s, size_type n, size_type pos = 0) const;//复制到s
    void swap(basic_string& str);
    size_type find(const basic_string& str,
        size_type pos = 0) const;//在pos开始查找str子字符串
    size_type find(const E *s, size_type pos, size_type n) const;//查找s的pos位置开始的n个字符
    size_type find(const E *s, size_type pos = 0) const;
    size_type find(E c, size_type pos = 0) const;
    size_type rfind(const basic_string& str,
        size_type pos = npos) const;//从后面开始查找
    size_type rfind(const E *s, size_type pos,
        size_type n = npos) const;
    size_type rfind(const E *s, size_type pos = npos) const;
    size_type rfind(E c, size_type pos = npos) const;
    size_type find_first_of(const basic_string& str,
        size_type pos = 0) const;//查找在字符串中第一个与str中的某个字符匹配的字符，返回它的位置。搜索从pos开始，如果没找到就返回string::npos 
    size_type find_first_of(const E *s, size_type pos,
        size_type n) const;
    size_type find_first_of(const E *s, size_type pos = 0) const;
    size_type find_first_of(E c, size_type pos = 0) const;
    size_type find_last_of(const basic_string& str,
        size_type pos = npos) const;//从后面开始查找第一个与str中的某个字符匹配的字符
    size_type find_last_of(const E *s, size_type pos,
        size_type n = npos) con/t;
    size_type find_last_of(const E *s, size_type pos = npos) const;
    size_type find_last_of(E c, size_type pos = npos) const;
    size_type find_first_not_of(const basic_string& str,
        size_type pos = 0) const;//返回在字符串中首次出现的不匹配str中的任何一个字符的首字符索引, 从pos开始搜索, 如果全部匹配则返回string::npos。
    size_type find_first_not_of(const E *s, size_type pos,
        size_type n) const;
    size_type find_first_not_of(const E *s, size_type pos = 0) const;
    size_type find_first_not_of(E c, size_type pos = 0) const;
    size_type find_last_not_of(const basic_string& str,
        size_type pos = npos) const;//从后面开始查找在字符串中出现的不匹配str中的任何一个字符的首字符索引, 从index开始搜索, 如果全部匹配则返回string::npos。
    size_type find_last_not_of(const E *s, size_type pos,
         size_type n) const;
    size_type find_last_not_of(const E *s,
        size_type pos = npos) const;
    size_type find_last_not_of(E c, size_type pos = npos) const;
    basic_string substr(size_type pos = 0, size_type n = npos) const;//返回子串
    int compare(const basic_string& str) const;///比较字符串
    int compare(size_type p0, size_type n0,
        const basic_string& str);
    int compare(size_type p0, size_type n0,
        const basic_string& str, size_type pos, size_type n);
    int compare(const E *s) const;
    int compare(size_type p0, size_type n0,
        const E *s) const;
    int compare(size_type p0, size_type n0,
        const E *s, size_type pos) const;
    A get_allocator() const;
protected:
    A allocator;
    };



string::npos







