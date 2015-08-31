template<class Key, class T, class Pred = less<Key>, class A = allocator<T> >
    class map {
public:

    explicit map(const Pred& comp = Pred(), const A& al = A());
    map(const map& x);
    map(const value_type *first, const value_type *last,
        const Pred& comp = Pred(),
            const A& al = A());
    iterator begin();
    const_iterator begin() const;
    iterator end();
    iterator end() const;
    reverse_iterator rbegin();
    const_reverse_iterator rbegin() const;
    reverse_iterator rend();
    const_reverse_iterator rend() const;
    size_type size() const;
    size_type max_size() const;
    bool empty() const;
    A get_allocator() const;
    A::reference operator[](const Key& key);///////////根据key获取引用
    pair<iterator, bool> insert(const value_type& x);
    iterator insert(iterator it, const value_type& x);
    void insert(const value_type *first, const value_type *last);//插入
    iterator erase(iterator it);
    iterator erase(iterator first, iterator last);
    size_type erase(const Key& key);//删除对应的key
    void clear();
    void swap(map x);
    key_compare key_comp() const;
    value_compare value_comp() const;
    iterator find(const Key& key);
    const_iterator find(const Key& key) const;//查找
    size_type count(const Key& key) const;//计算个数
    iterator lower_bound(const Key& key);
    const_iterator lower_bound(const Key& key) const;
    iterator upper_bound(const Key& key);
    const_iterator upper_bound(const Key& key) const;
    pair<iterator, iterator> equal_range(const Key& key);
    pair<const_iterator, const_iterator>
        equal_range(const Key& key) const;
protected:
    A allocator;
    };


iterator lower_bound(const Key& key);//是指key对应的最小的值
iterator upper_bound(const Key& key);//是指key对应的最大还大一格的值


multimap 和 multiset 的find 。因为这两个容器都可以存放相同键值的数据。所以说find一个键值本可以返回多个结果，但是你这样想就错了。multiset 和multimap只会返回第一个结果。如果要得到相同的键值的所有结果可以用以下的方式,还要需要注意的一点set,map是重载了[]操作符的，所以可以像数组或者vector那样直接访问，但是multiset和multimap是没有的，所以必须要用find一类的方法。（multiset同理此处略去）

方式一：  
    typedefstd::multimap<int,int> Pairs;  
    multimap<int,int>::iterator iter;  
    Pairs pairs;  
    pairs.insert(make_pair(1, 1));  
    pairs.insert(make_pair(1,2));  
    pairs.insert(make_pair(1,3));  
    pairs.insert(make_pair(2, 4));  
    pairs.insert(make_pair(2,5));  
    pairs.insert(make_pair(3,2));  
    intkey = 1;  
    Pairs::iterator position = pairs.lower_bound(key);  
    while(position != pairs.upper_bound(key))  
    {  
        cout << position->first << "\t"<< position->second;  
        ++position;  
    }  
方式二：  
    typedefstd::multimap<int,int> Pairs;  
    multimap<int,int>::iterator iter;  
    Pairs pairs;  
    pairs.insert(make_pair(1, 1));  
    pairs.insert(make_pair(1,2));  
    pairs.insert(make_pair(1,3));  
    pairs.insert(make_pair(2, 4));  
    pairs.insert(make_pair(2,5));  
    pairs.insert(make_pair(3,2));  
   
    iter = pairs.find(1);    //find返回的是第一个找到的元素的位置  
    if(iter == pairs.end()) cout << "can not find 2\n";  //注意判断没有找到的办法  
    elsecout << iter->second << endl;  
   
    pair<Pairs::iterator, Pairs::iterator> range; //前面说了find只能返回第一个位置  
    range = pairs.equal_range(1);             //要是想得到全部，只能这样啦  
    for(iter = range.first; iter != range.second; iter++)  
            cout << iter->first << " " << iter->second << endl;  