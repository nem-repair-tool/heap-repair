data node2 {
  int val;
  node2 prev;
  node2 next;
}
dll<pr, k> == emp & self=null & k = 0
  or self::node2<_, pr,q>*q::dll<self, n2> & k = n2 + 1 & k > 0;
void append(node2 x, node2 y)
	requires x::dll<q, m> * y::dll<p, n> & m>0
	ensures x::dll<q, m+n>;
{
	if (x.next == null) {
    x.next = y;
    if (y != null)
      y.prev = x;
	}
	else {
    append(x.next, y);
	}
}