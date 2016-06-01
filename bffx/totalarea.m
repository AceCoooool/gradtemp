function [area,part]=totalarea(d,l,s,h,R)
[ftheta,ltheta]=limittheta2(d,l,h,R);
k=tan(ltheta);
lmax=sqrt(l.^2+d.^2);
rinit=abs(k*(63.64)+h)./sqrt(k.^2+1)+R/1000;
pos1=sqrt(R.^2-rinit.^2)>s/2;
rinit(pos1)=sqrt(R.^2-(s./2).^2);
if rinit<R
    area=2*integral(@(r)yuan(r,h,k,lmax),rinit,R,'ArrayValued',true);
else
    area=0;
end
% area=2*integral(@(r)yuan(r,h,k,lmax),0,R,'ArrayValued',true);
part=area./(4*pi*R^2);