all = dir('./final-tif');
all = all(3:end);
for i=1:length(all)
	I = imread(['./final-tif' '/' all(i).name]);
	maxDepth(i) = max(max(I));
end
averageMaxDepth = sum(maxDepth)/length(all);
fprintf('The average max depth is %f\n', averageMaxDepth);

diffMaxDepth = max(abs(maxDepth - averageMaxDepth));
fprintf('The max deviation from average max depth is %f\n', diffMaxDepth);