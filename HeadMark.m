%% 读入视频序列，点击鼠标，返回点击位置坐标，并写入txt
file ='V:\Data\FallBed\Dataset_v5\012_201607051856_tongji_fallbed_marked_liruiibo'
fileImg =[file,'\images.txt'];
fidin=fopen(fileImg,'r'); 
        
headXYZ = zeros(10000,3);
i=0;
while ~feof(fidin) % 判断是否为文件末尾
    file_name = fgetl(fidin);  % 从文件读行 
    imgRaw = imread(file_name);
    img =double(imgRaw);
    m = max(img(:)) ; n = min(img(:)) ;
    imgGray = uint8((img-n)*255/(m-n));
    imshow(imgGray);
    [x,y,button] = ginput(1)
    if((y>212)||(x>256)||(x<1)||(y<1))
        fprintf('click wrong place(%d,%d)',x,y);
        return;
    end
    while(imgRaw(round(y),round(x))==0)
        [x,y] = ginput(1)
        if((y>212)||(x>256)||(x<1)||(y<1))
            fprintf('click wrong place(%d,%d)',x,y);
            return;
        end
    end
    
    i = i+1;
    headXYZ(i,1)=round(x);
    headXYZ(i,2)=round(y);
    headXYZ(i,3)=imgRaw(round(y),round(x));
end

fidout = fopen( fullfile(file, 'headXYZ.txt'), 'w');
j=1;
fprintf(fidout,'%7d',i);
fprintf(fidout,'%7d',3);
fprintf(fidout,'\n');
while(headXYZ(j,1)~=0)
    fprintf(fidout,'%7d', headXYZ(j,1));
    fprintf(fidout,'%7d', headXYZ(j,2));
    fprintf(fidout,'%7d', headXYZ(j,3));
    fprintf(fidout,'\n');
    j=j+1;
end
fclose(fidout);

return