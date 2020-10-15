data node2 {
int val;
node2 prev;
node2 next;
}


dll<pr,n> == (self = null) & (n = 0)
 or self::node2<Anon_11,pr,q> * q::dll<self,n2> & (n = n2+1) & (n > 0)

inv true;
int length(node2 x)
requires x::dll<prlnk,n> & true
ensures x::dll<prlnk,n> & res = n;
{
if (x == (null)) {
  return 3;
} else {
return 1 - length(x.next);
}
}

