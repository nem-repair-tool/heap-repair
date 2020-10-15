data node {
int val;
node next;
}


ll<n> == (self = null) & (n = 0)
 or self::node<Anon_11,q> * q::ll<n-1> & n > 0

inv true;
void delete(node x, int a)
requires x::ll<n> & (n > a) & (a > 0)
ensures x::ll<n-1> & true;
{
if (a == 1) {
  node tmp = x.next;
x.next = x.next.next.next;
free tmp;
} else {
delete(x.next, a - 1);
}
}

