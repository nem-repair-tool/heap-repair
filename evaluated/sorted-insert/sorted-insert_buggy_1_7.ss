data node {
int val;
node next;
}


sll<n,sm,lg> == (self = null) & ((n = 0) & (sm <= lg))
 or (exists qs, ql, qmin, q : self::node<qmin,q> * q::sll<n-1,qs,ql> & (qmin <= qs) & ((ql <= lg) & (sm <= qmin)))

inv (n >= 0) & (sm <= lg);
ll<n> == (self = null) & (n = 0)
 or self::node<Anon_11,q> * q::ll<n-1> & true

inv n >= 0;
node insert2(node x, node vn)
requires x::sll<n,sm,lg> * vn::node<v,Anon_12> & true
ensures res::sll<n+1,mi,ma> & (mi = min(v,sm)) & (ma = max(v,lg));
{
if (x == (null)) {
  vn.next = null;
return vn;
} else {
if (vn.val <= x.val) {
  vn.next = x;
return vn;
} else {
x.next.next = insert2(x.next, vn);;
return x;
}
}
}

