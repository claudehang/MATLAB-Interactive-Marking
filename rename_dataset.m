all = dir('./merge-seg-extra');
all = all(3:end);
for i=1:length(all)
%     Im = imread(['./png/' all(i).name]);
%     imwrite(Im, sprintf('./final-depth/%04d.png',i));
    load(['./merge-seg-extra/' all(i).name]);
    save(sprintf('./merge-seg-extra-server/%04d.mat',i+90),'Limg');
    clear Limg
end