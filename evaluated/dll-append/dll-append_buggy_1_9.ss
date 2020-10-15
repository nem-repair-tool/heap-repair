data node2 {
int val;
node2 prev;
node2 next;
}


dll<pr,k> == (self = null) & (k = 0)
 or self::node2<Anon_11,pr,q> * q::dll<self,n2> & (k = n2+1) & (k > 0)

inv true;
void append(node2 x, node2 y)
requires x::dll<q,m> * y::dll<p,n> & m > 0
ensures x::dll<q,m+n> & true;
{
if (x.next == (null)) {
  x.next = y;
if (y != (null)) {
  y.prev = x.prev;
}
} else {
append(x.next, y);
}
}

