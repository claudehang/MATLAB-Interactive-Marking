% % without person
% clear
% i=142;
% name=sprintf('img_%04d.mat',i);
% load(['./seg_bed_extra/' name]); % load bed mask as segmentation
% Lbed=mask_bed;
% Lbed=double(Lbed);
% Lflag=1-mask_bed;
% Lflag=double(Lflag);
% load(['./seg_floor_extra/' name]);
% Lfloor=Lflag.*mask_floor;
% Lflag=1-(Lfloor+Lbed);
% load(['./seg_wall_extra_one/' name]);
% Lwall_one=Lflag.*mask_wall;
% Lflag=1-(Lfloor+Lbed+Lwall_one);
% clear mask_wall
% load(['./seg_wall_extra_two/' name]);
% Lwall_two=Lflag.*mask_wall;
% Limg=Lbed+Lfloor*2+(Lwall_one+Lwall_two)*3;
% save(['./merge-seg-extra/' name],'Limg');

% with person
for i=53:85
    name=sprintf('img_%04d.mat',i+90);
    load(['./seg_bed_extra/' name]); % load bed mask as segmentation
    Lbed=mask_bed;
    Lbed=double(Lbed);
    Lflag=1-mask_bed;
    Lflag=double(Lflag);
    load(['./seg_person_extra/' name]);
    mask_person=double(mask_person);
    Lperson=Lflag.*mask_person;
    Lflag=1-(Lperson+Lbed);
    load(['./seg_floor_extra/' name]);
    Lfloor=Lflag.*mask_floor;
    Lflag=1-(Lfloor+Lbed+Lperson);
    load(['./seg_wall_extra_one/' name]);
    Lwall_one=Lflag.*mask_wall;
    Lflag=1-(Lfloor+Lbed+Lwall_one+Lperson);
    clear mask_wall
    load(['./seg_wall_extra_two/' name]);
    Lwall_two=Lflag.*mask_wall;
    Limg=Lbed+Lfloor*2+(Lwall_one+Lwall_two)*3+Lperson*4;
    save(['./merge-seg-extra/' name],'Limg');
    clear
end


