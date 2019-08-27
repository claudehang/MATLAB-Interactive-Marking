clear
im=imread('test.png');
[hei,wid]=size(im);
imshow(im);
[x,y] = ginput(3);  % x is horizontal, y is vertical
x=uint16(x);
y=uint16(y);
p1=[y(1) x(1) im(y(1),x(1))];
p2=[y(2) x(2) im(y(2),x(2))];
p3=[y(3) x(3) im(y(3),x(3))];
[n,d]=get_plane(p1,p2,p3);
[dim_x,dim_y]=meshgrid(1:wid,1:hei);
dim_x=dim_x(:);
dim_y=dim_y(:);
im_vec=im(:);
p_img=[dim_y';dim_x';im_vec']; % get [row,col,depth] by column by 3xM
dist_img=pp_dist(n,d,double(p_img));
dist_img=reshape(dist_img,hei,wid);
[ind_row,ind_col]=find(dist_img<5);
mask=zeros(hei,wid);
mask(sub2ind(size(mask),ind_row,ind_col))=1;
%mask(ind_row,ind_col)=1;
%mask=logical(mask);
figure(2)
imagesc(mask);