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
    void resize(size_type n, T x = T());//���õ�Ԫ�ص�����
    size_type size() const;//��ȡԪ�ص�����
    size_type max_size() const;
    bool empty() const;
    A get_allocator() const;
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
    iterator insert(iterator it, const T& x = T());//����Ԫ��
    void insert(iterator it, size_type n, const T& x);
    void insert(iterator it,
        const_iterator first, const_iterator last);
    void insert(iterator it,
        const T *first, const T *last);
    iterator erase(iterator it);//ɾ��Ԫ��
    iterator erase(iterator first, iterator last);
    void clear();
    void swap(list x);//��������
    void splice(iterator it, list& x);//��xƴ�ӵ�itǰ
    void splice(iterator it, list& x, iterator first);
    void splice(iterator it, list& x, iterator first, iterator last);
    void remove(const T& x);//�Ƴ�ָ��ֵ
    void remove_if(binder2nd<not_equal_to<T> > pr);//ɾ������������ֵ
    void unique();//ȥ�أ�ע��Ҫ�����򣬼�������sort��
    void unique(not_equal_to<T> pr);
    void merge(list& x);//�ϲ�����list
    void merge(list& x, greater<T> pr);
    void sort();//����
    template<class Pred>
        void sort(greater<T> pr);
    void reverse();///��תlist
protected:
    A allocator;
    };
