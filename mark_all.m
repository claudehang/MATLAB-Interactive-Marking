clear
i=3;


name=sprintf('img_%04d.mat',i);
load(['./bed-seg/' name]);
Lbed=segmentation;
im_tif=imread(sprintf('./tif/%04d.tif',i));
im=imread(sprintf('./png/%04d.png',i));


Lflag=1-Lbed;
mask_floor=hand_mark(im_tif,im,'_floor',i);
Lfloor=Lflag.*mask_floor;
Lflag=Lfoor+Lbed;
mask_wall=hand_mark(im_tif,im,'_wall',i);
Lwall=Lflag.*mask_wall;
Limg=Lbed+Lfoor*2+Lwall*3;