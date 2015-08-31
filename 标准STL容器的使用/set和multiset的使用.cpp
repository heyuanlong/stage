template<class Key, class Pred = less<Key>, class A = allocator<Key> >
    class set {
public:

    explicit set(const Pred& comp = Pred(), const A& al = A());
    set(const set& x);
    set(const value_type *first, const value_type *last,
        const Pred& comp = Pred(), const A& al = A());
    const_iterator begin() const;
    iterator end() const;
    const_reverse_iterator rbegin() const;
    const_reverse_iterator rend() const;
    size_type size() const;
    size_type max_size() const;
    bool empty() const;
    A get_allocator() const;
    pair<iterator, bool> insert(const value_type& x);///插入
    iterator insert(iterator it, const value_type& x);
    void insert(InIt first, InIt last);
    iterator erase(iterator it);
    iterator erase(iterator first, iterator last);//删除
    size_type erase(const Key& key);
    void clear();
    void swap(set x);
    key_compare key_comp() const;
    value_compare value_comp() const;
    const_iterator find(const Key& key) const;//查找
    size_type count(const Key& key) const;//判断key是否在容器里
    const_iterator lower_bound(const Key& key) const;
    const_iterator upper_bound(const Key& key) const;
    pair<const_iterator, const_iterator>
        equal_range(const Key& key) const;
protected:
    A allocator;
    };

//对multiset
    它的find是找到第一个
    它的count可能会大于1


