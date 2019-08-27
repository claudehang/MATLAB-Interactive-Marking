all = dir('./png-extra-person');
all = all(3:end);
for i=53:85
    mask_person = imread(['./png-extra-person/' all(i).name]);
    mask_person = mask_person-254;
    save(sprintf('./seg_person_extra/img_%04d.mat',i+90),'mask_person');
end