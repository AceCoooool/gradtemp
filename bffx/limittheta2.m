function [ftheta,ltheta]=limittheta2(d,l,h,r)
theta=atan(d./l);
if r==63.64
    ftheta=pi/2;
    ltheta=pi/2+theta;
else
    tempk1=(25*(3182*h + 25*r.*(4*h.^2 - 4*r.^2 + 10125124/625).^(1/2)))./(2*(625*r.^2 - 2531281));
    tempk2=(25*(3182*h- 25*r.*(4*h.^2 - 4*r.^2 + 10125124/625).^(1/2)))./(2*(625*r.^2 - 2531281));
    if r>63.64
        ftheta=atan(max(tempk1,tempk2));ltheta=ftheta+theta;
    else
        ftheta=atan(min(tempk2,tempk1))+pi;ltheta=ftheta+theta;
    end
end