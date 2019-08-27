function [n,d]=get_plane(p1,p2,p3)
p1=double(p1);
p2=double(p2);
p3=double(p3);
v1=p3-p1;
v2=p2-p1;
n=cross(v1,v2);
d=dot(n,p3);