function [ftheta,ltheta]=reclimittheta(d,l,r,h)
theta=atan(d/l);
if r/2<63.64
    ftheta=pi-atan((r/2+h)/(63.64-r/2));
    ltheta=ftheta+theta;
elseif r/2==63.64
    ftheta=pi/2;
    ltheta=pi/2+theta;
else
    ftheta=atan(h/(r/2-63.64));
    ltheta=ftheta+theta;
end
    