template<class T, class A = allocator<T> >
    class list {
public:

    explicit list(const A& al = A());
    explicit list(size_type n, const T& v = T(), const A& al = A());
    list(const list& x);
    list(const_iterator first, const_iterator last,
        const A& al = A());
    iterator begin();
    const_iterator begin() const;
    iterator end();
    iterator end() const;
    reverse_iterator rbegin();
    const_reverse_iterator rbegin() const;
    reverse_iterator rend();
    const_reverse_iterator rend() const;
    void resize(size_type n, T x = T());//设置的元素的数量
    size_type size() const;//获取元素的数量
    size_type max_size() const;
    bool empty() const;
    A get_allocator() const;
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
    iterator insert(iterator it, const T& x = T());//插入元素
    void insert(iterator it, size_type n, const T& x);
    void insert(iterator it,
        const_iterator first, const_iterator last);
    void insert(iterator it,
        const T *first, const T *last);
    iterator erase(iterator it);//删除元素
    iterator erase(iterator first, iterator last);
    void clear();
    void swap(list x);//交换容器
    void splice(iterator it, list& x);//把x拼接到it前
    void splice(iterator it, list& x, iterator first);
    void splice(iterator it, list& x, iterator first, iterator last);
    void remove(const T& x);//移除指定值
    void remove_if(binder2nd<not_equal_to<T> > pr);//删除满足条件的值
    void unique();//去重（注意要先排序，即先运行sort）
    void unique(not_equal_to<T> pr);
    void merge(list& x);//合并两个list
    void merge(list& x, greater<T> pr);
    void sort();//排序
    template<class Pred>
        void sort(greater<T> pr);
    void reverse();///翻转list
protected:
    A allocator;
    };
