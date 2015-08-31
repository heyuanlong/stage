class deque {
public:

    explicit deque(const A& al = A());
    explicit deque(size_type n, const T& v = T(), const A& al = A());
    deque(const deque& x);
    deque(const_iterator first, const_iterator last,
        const A& al = A());
    iterator begin();
    const_iterator begin() const;
    iterator end();
    iterator end() const;
    reverse_iterator rbegin();
    const_reverse_iterator rbegin() const;
    reverse_iterator rend();
    const_reverse_iterator rend() const;
    void resize(size_type n, T x = T());//设置拥有多少个元素
    size_type size() const;
    size_type max_size() const;//最多拥有的元素个数
    bool empty() const;
    A get_allocator() const;
    reference at(size_type pos);//取得第pos位置上的元素的引用
    const_reference at(size_type pos) const;
    reference operator[](size_type pos);
    const_reference operator[](size_type pos);//取得第pos位置上的元素的引用
    reference front();//获取第一个元素的引用
    const_reference front() const;
    reference back();//获取最后一个元素的引用
    const_reference back() const;
    void push_front(const T& x);//插入头部
    void pop_front();//删除头元素
    void push_back(const T& x);//插入尾部
    void pop_back();//删除最后一个元素
    void assign(const_iterator first, const_iterator last);//重新赋值
    void assign(size_type n, const T& x = T());
    iterator insert(iterator it, const T& x = T());
    void insert(iterator it, size_type n, const T& x);//插入元素
    void insert(iterator it,
        const_iterator first, const_iterator last);
    iterator erase(iterator it);//删除元素
    iterator erase(iterator first, iterator last);
    void clear();
    void swap(deque x);
protected:
    A allocator;
    };