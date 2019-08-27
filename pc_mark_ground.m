% mark the ground with point cloud as input
% use two criteria, dist to given plane and angle with plane normal
% criterion two the angle seems not useful and gives bad result so discard
clear
im_tif=imread('mark_gd.tif');
point_cloud=get_pc_with_tif(im_tif);
im=imread('mark_gd.png');
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
X=p_img_x;
Y=p_img_z;
Z=p_img_y;
%normal_img=get_normal(X,Y,Z,hei,wid); % calculate normal per pix

% criterion one the dist
dist_img=pp_dist(n,d,p_img);
dist_img=reshape(dist_img,hei,wid);
[ind_row_dist,ind_col_dist]=find(dist_img<70);
mask_dist=zeros(hei,wid);
mask_dist(sub2ind(size(mask_dist),ind_row_dist,ind_col_dist))=1;

% criterion two the angle
% n_one=n./sqrt(sum(n.^2));
% angle_img=normal_img(:,:,1)*n_one(1)...
%     +normal_img(:,:,2)*n_one(2)+normal_img(:,:,3)*n_one(3);
% [ind_row_ang,ind_col_ang]=find(angle_img>0.1);
% mask_angle=zeros(hei,wid);
% mask_angle(sub2ind(size(mask_angle),ind_row_ang,ind_col_ang))=1;

mask=mask_dist;%.*mask_angle;
mask_vis=cat(3,mask*225,mask*225,mask*0);
im_vis=cat(3,im,im,im);
merge=im_vis*0.5+uint8(mask_vis)*0.5;
figure(2)
imshow(merge);

