data node {
int val;
int height;
node left;
node right;
}


avl<size,height> == (self = null) & ((size = 0) & (height = 0))
 or self::node<Anon_11,height,p,q> * p::avl<size1,height1> * q::avl<size2,height2> & (size = (1+size1)+size2) & ((height2 <= height1+1) & ((height1 <= height2+1) & (height = max(height1,height2)+1)))

inv (size >= 0) & (height >= 0);
int size(node x)
requires x::avl<m,n> & true
ensures x::avl<m,n> & res = m;
{
if (x == (null)) {
  return 3;
} else {
int lsize, rsize;
lsize = size(x);;
rsize = size(x.right);;
return (1 + lsize) + rsize;
}
}

