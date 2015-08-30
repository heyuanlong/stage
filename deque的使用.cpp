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
    void resize(size_type n, T x = T());//����ӵ�ж��ٸ�Ԫ��
    size_type size() const;
    size_type max_size() const;//���ӵ�е�Ԫ�ظ���
    bool empty() const;
    A get_allocator() const;
    reference at(size_type pos);//ȡ�õ�posλ���ϵ�Ԫ�ص�����
    const_reference at(size_type pos) const;
    reference operator[](size_type pos);
    const_reference operator[](size_type pos);//ȡ�õ�posλ���ϵ�Ԫ�ص�����
    reference front();//��ȡ��һ��Ԫ�ص�����
    const_reference front() const;
    reference back();//��ȡ���һ��Ԫ�ص�����
    const_reference back() const;
    void push_front(const T& x);//����ͷ��
    void pop_front();//ɾ��ͷԪ��
    void push_back(const T& x);//����β��
    void pop_back();//ɾ�����һ��Ԫ��
    void assign(const_iterator first, const_iterator last);//���¸�ֵ
    void assign(size_type n, const T& x = T());
    iterator insert(iterator it, const T& x = T());
    void insert(iterator it, size_type n, const T& x);//����Ԫ��
    void insert(iterator it,
        const_iterator first, const_iterator last);
    iterator erase(iterator it);//ɾ��Ԫ��
    iterator erase(iterator first, iterator last);
    void clear();
    void swap(deque x);
protected:
    A allocator;
    };