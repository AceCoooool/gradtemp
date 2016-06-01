function leng=yuan(r,h,k,lmax)
leng=zeros(size(r));
% [p1x,p1y,p2x,p2y]=cnnpoint(k,h,r);
% if isreal(p1x)
%     d1(isreal(p1x))=sqrt(p1x.^2+p1y.^2);d2=sqrt(p2x.^2+p2y.^2);
% else
%     d1=lmax+1;d2=lmax+1;
% end
[p1x,p1y,p2x,p2y]=cnnpoint(k,h,r);
d1=sqrt(p1x.^2+p1y.^2);d2=sqrt(p2x.^2+p2y.^2);
pos1=d1<=lmax&d2<=lmax;pos2=max(d1,d2)>lmax;pos3=d1>lmax&d2>lmax;
leng(pos2)=r(pos2)*2.*asin((lmax-min(d1(pos2),d2(pos2)))/2./r(pos2));
leng(pos3)=0;
leng(pos1)=r(pos1)*2.*asin((abs(d2(pos1)-d1(pos1)))/2./r(pos1));
