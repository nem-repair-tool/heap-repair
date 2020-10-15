data node2 {
int val;
node2 left;
node2 right;
}


tree1<m> == (self = null) & (m = 0)
 or self::node2<Anon_11,p,q> * p::tree1<m1> * q::tree1<m2> & m = 1+max(m1,m2)

inv m >= 0;
int height(node2 z)
requires z::tree1<m> & true
ensures z::tree1<m> & (res = m) & (res >= 0);
{
if (z == (null)) {
  return 0;
} else {
if (height(z.left) > height(z.right)) {
  return 1 + height(z);
} else {
return 1 + height(z.right);
}
}
}

