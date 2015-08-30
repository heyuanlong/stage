template<class T, class A = allocator<T> >
    class vector {
public:

    explicit vector(const A& al = A());//Ĭ�Ϲ��캯��
    explicit vector(size_type n, const T& v = T(), const A& al = A());//��ʼ��n��v
    vector(const vector& x);//��ֵ��ʼ��
    vector(const_iterator first, const_iterator last,
        const A& al = A());//iterator�����ֵ
    void reserve(size_type n);//�ı�capacity�Ĵ�С
    size_type capacity() const;//����
    iterator begin();
    const_iterator begin() const;
    iterator end();
    iterator end() const;
    reverse_iterator rbegin();
    const_reverse_iterator rbegin() const;
    reverse_iterator rend();
    const_reverse_iterator rend() const;
    void resize(size_type n, T x = T());//�ı�size�Ĵ�С���ѳ�ʼ����
    size_type size() const;//���е�Ԫ����
    size_type max_size() const;//�������
    bool empty() const;//�Ƿ�Ϊ��
    A get_allocator() const;
    reference at(size_type pos);//ȡ�õ�pos��Ԫ�ص�����
    const_reference at(size_type pos) const;
    reference operator[](size_type pos);
    const_reference operator[](size_type pos);//ȡ�õ�pos��Ԫ�ص�����
    reference front();//ȡ�õ�һ��Ԫ�ص�����
    const_reference front() const;
    reference back();//ȡ�����һ��Ԫ�ص�����
    const_reference back() const;
    void push_back(const T& x);//�ں������һ��Ԫ��
    void pop_back();//�ں���ɾ��һ��Ԫ��
    void assign(const_iterator first, const_iterator last);//���¸�ֵ��������
    void assign(size_type n, const T& x = T());//���¸�ֵ��������
    iterator insert(iterator it, const T& x = T());//��iteratorǰ����һ��Ԫ��
    void insert(iterator it, size_type n, const T& x);//��iteratorǰ����n��Ԫ��
    void insert(iterator it,
        const_iterator first, const_iterator last);//��iteratorǰ����
    iterator erase(iterator it);//ɾ��һ��iteratorָ���Ԫ��
    iterator erase(iterator first, iterator last);//ɾ��һ��Ԫ��
    void clear();//�����������
    void swap(vector x);//��������
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










