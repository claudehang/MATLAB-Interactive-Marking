function hand_mark(im_tif,im,class,i)

point_cloud=get_pc_with_tif(im_tif);

[hei,wid]=size(im);
imshow(im);
[x,y] = ginput(3);  % x is horizontal, y is vertical
x=uint16(x);
y=uint16(y);
p1=[point_cloud(y(1),x(1),1) point_cloud(y(1),x(1),2) point_cloud(y(1),x(1),3)];
p2=[point_cloud(y(2),x(2),1) point_cloud(y(2),x(2),2) point_cloud(y(2),x(2),3)];
p3=[point_cloud(y(3),x(3),1) point_cloud(y(3),x(3),2) point_cloud(y(3),x(3),3)];
[n,d]=get_plane(p1,p2,p3);

% seperate x,y,z of point cloud into three vector
p_img_x=point_cloud(:,:,1);
p_img_x=p_img_x(:);
p_img_y=point_cloud(:,:,2);
p_img_y=p_img_y(:);
p_img_z=point_cloud(:,:,3);
p_img_z=p_img_z(:);
p_img=[p_img_x'; p_img_y'; p_img_z'];

% criterion one the dist
dist_img=pp_dist(n,d,p_img);
dist_img=reshape(dist_img,hei,wid);
[ind_row_dist,ind_col_dist]=find(dist_img<70);
mask_dist=zeros(hei,wid);
mask_dist(sub2ind(size(mask_dist),ind_row_dist,ind_col_dist))=1;


mask=mask_dist;
save(['./seg' class sprintf('/img_%04d.mat',i)],...
        'mask');
mask_vis=cat(3,mask*225,mask*225,mask*0);
im_vis=cat(3,im,im,im);
merge=im_vis*0.5+uint8(mask_vis)*0.5;
figure(2)
imshow(merge);
