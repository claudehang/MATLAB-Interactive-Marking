clear
i=101;
name=sprintf('img_%04d.mat',i);
load(['./bed-seg/' name]); % load bed mask as segmentation
Lbed=segmentation;
Lbed=double(Lbed);
Lflag=1-segmentation;
Lflag=double(Lflag);
load(['./seg_floor/' name]);
Lfloor=Lflag.*mask_floor;
Lflag=1-(Lfloor+Lbed);
load(['./seg_wall_one/' name]);
Lwall_one=Lflag.*mask_wall;
Lflag=1-(Lfloor+Lbed+Lwall_one);
clear mask_wall
load(['./seg_wall_two/' name]);
Lwall_two=Lflag.*mask_wall;
Lflag=1-(Lfloor+Lbed+Lwall_one+Lwall_two);
clear mask_wall
load(['./seg_wall_three/' name]);
Lwall_three=Lflag.*mask_wall;
Limg=Lbed+Lfloor*2+(Lwall_one+Lwall_two+Lwall_three)*3;
save(['./merge-seg/' name],'Limg');