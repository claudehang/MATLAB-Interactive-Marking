all = dir('./whole-result');
all = all(3:end);
for i=1:length(all)
    Limg=imread(['./whole-result/' all(i).name]);
    color_mask=label2rgb(Limg,@jet,[0 0 0]);
    im=imread(['./whole-depth/' all(i).name(1:end-4) '.png']);
    im_fake_color=cat(3,im,im,im);
    final_image=im_fake_color*0.7+color_mask*0.3;
    imwrite(final_image,['./whole-colorized/' all(i).name(1:end-4) '.png']);
    clear Limg
end