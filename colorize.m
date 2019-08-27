% all = dir('./final-mask');
% all = all(3:end);
% for i=1:length(all)
%     load(['./final-mask/' all(i).name]);
%     color_mask=label2rgb(Limg,@jet,[0 0 0]);
%     im=imread(['./final-depth/' all(i).name(1:end-4) '.png']);
%     im_fake_color=cat(3,im,im,im);
%     final_image=im_fake_color*0.7+color_mask*0.3;
%     imwrite(final_image,['./final-colorized/' all(i).name(1:end-4) '.png']);
%     clear Limg
% end


all = dir('./full-mask');
all = all(3:end);
disorder=randperm(length(all));
for i=1:length(all)
    ind=disorder(i);
    
    load(['./full-mask/' all(i).name]);
    load(sprintf('./full-mask/%04d.mat',ind));
    save(sprintf('./disorder-mask/img_%04d.mat',i), 'Limg');
    
    color_mask=label2rgb(Limg,@jet,[0 0 0]);
    
    im=imread(sprintf('./full-png/%04d.png',ind));
    imwrite(im, sprintf('./disorder-png/img_%04d.png',i));
    
    im=imread(sprintf('./full-tif/%04d.tif',ind));
    imwrite(im, sprintf('./disorder-tif/img_%04d.tif',i));
    
    im_fake_color=cat(3,im,im,im);
    final_image=uint8(im_fake_color)*0.7+uint8(color_mask)*0.3;
    imwrite(final_image, sprintf('./disorder-colorized/img_%04d.png',i));
    clear Limg
end

