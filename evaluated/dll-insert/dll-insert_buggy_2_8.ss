data node2 {
int val;
node2 prev;
node2 next;
}


dll<p,n> == (self = null) & (n = 0)
 or self::node2<Anon_11,p,q> * q::dll<self,n-1> & n > 0

inv true;
void insert(node2 x, int a)
requires x::dll<p,n> & n > 0
ensures x::dll<p,n+1> & true;
{
if (x.next == (null)) {
  x.next.next = new node2(a, x, null);
} else {
insert(x, a);
}
}

