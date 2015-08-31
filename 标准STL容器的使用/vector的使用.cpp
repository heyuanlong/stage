template<class T, class A = allocator<T> >
    class vector {
public:

    explicit vector(const A& al = A());//默认构造函数
    explicit vector(size_type n, const T& v = T(), const A& al = A());//初始化n个v
    vector(const vector& x);//赋值初始化
    vector(const_iterator first, const_iterator last,
        const A& al = A());//iterator间隔赋值
    void reserve(size_type n);//改变capacity的大小
    size_type capacity() const;//容量
    iterator begin();
    const_iterator begin() const;
    iterator end();
    iterator end() const;
    reverse_iterator rbegin();
    const_reverse_iterator rbegin() const;
    reverse_iterator rend();
    const_reverse_iterator rend() const;
    void resize(size_type n, T x = T());//改变size的大小（已初始化）
    size_type size() const;//已有的元素量
    size_type max_size() const;//最大容量
    bool empty() const;//是否为空
    A get_allocator() const;
    reference at(size_type pos);//取得第pos个元素的引用
    const_reference at(size_type pos) const;
    reference operator[](size_type pos);
    const_reference operator[](size_type pos);//取得第pos个元素的引用
    reference front();//取得第一个元素的引用
    const_reference front() const;
    reference back();//取得最后一个元素的引用
    const_reference back() const;
    void push_back(const T& x);//在后面插入一个元素
    void pop_back();//在后面删除一个元素
    void assign(const_iterator first, const_iterator last);//重新赋值整个容器
    void assign(size_type n, const T& x = T());//重新赋值整个容器
    iterator insert(iterator it, const T& x = T());//在iterator前插入一个元素
    void insert(iterator it, size_type n, const T& x);//在iterator前插入n个元素
    void insert(iterator it,
        const_iterator first, const_iterator last);//在iterator前插入
    iterator erase(iterator it);//删除一个iterator指向的元素
    iterator erase(iterator first, iterator last);//删除一段元素
    void clear();//清空整个容器
    void swap(vector x);//交换容器
protected:
    A allocator;
    };



// constructors used in the same order as described above:
  std::vector<int> first;                                // empty vector of ints
  std::vector<int> second (4,100);                       // four ints with value 100
  std::vector<int> third (second.begin(),second.end());  // iterating through second
  std::vector<int> fourth (third);                       // a copy of third
// the iterator constructor can also be used to construct from arrays:
  int myints[] = {16,2,77,29};
  std::vector<int> fifth (myints, myints + sizeof(myints) / sizeof(int) );


 //std::vector<T>::iterator it;










