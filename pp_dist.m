function dist_img=pp_dist(n,d,p_img)
dist_img=abs((n*p_img-d)./sqrt(sum(n.^2)));