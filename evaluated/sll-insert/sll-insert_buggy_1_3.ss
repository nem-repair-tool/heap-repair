data node {
int val;
node next;
}


ll<n> == (self = null) & (n = 0)
 or self::node<Anon_11,q> * q::ll<n-1> & n > 0

inv true;
void insert(node x, int a)
requires x::ll<n> & n > 0
ensures x::ll<n+1> & true;
{
if (x.next == (null)) {
  x.next = new node(a, null);
} else {
insert(x.next.next, a);
}
}

