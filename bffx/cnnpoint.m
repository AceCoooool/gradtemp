function [p1x,p1y,p2x,p2y]=cnnpoint(k,h,r)
% p1x=(84*k - h.*k.^2 + k.*(- h.^2 - 168*h.*k + k.^2.*r.^2 - 7056*k.^2 + r.^2).^(1/2))./(k.*(k.^2 + 1)) - 84;
% p2x=-(h.*k.^2 - 84*k + k.*(- h.^2 - 168*h.*k + k.^2.*r.^2 - 7056*k.^2 + r.^2).^(1/2))./(k.*(k.^2 + 1)) - 84;
% p1y=(84*k - h.*k.^2 + k.*(- h.^2 - 168*h.*k + k.^2.*r.^2 - 7056*k.^2 + r.^2).^(1/2))./(k.^2 + 1);
% p2y=-(h.*k.^2 - 84*k + k.*(- h.^2 - 168*h.*k + k.^2.*r.^2 - 7056*k.^2 + r.^2).^(1/2))./(k.^2 + 1);

p1x=(3182*k + 25*k.*(- 4*h.^2 - (12728*h.*k)/25 + 4*k.^2.*r.^2 - (10125124*k.^2)/625 + 4*r.^2).^(1/2) - 50*h.*k.^2)./(50*k.*(k.^2 + 1)) - 1591/25;
p2x=-(25*k.*(- 4*h.^2 - (12728*h.*k)/25 + 4*k.^2.*r.^2 - (10125124*k.^2)/625 + 4*r.^2).^(1/2) - 3182*k + 50*h.*k.^2)./(50*k.*(k.^2 + 1)) - 1591/25;
p1y=(3182*k + 25*k.*(-4*h.^2 - (12728*h.*k)/25 + 4*k.^2.*r.^2 - (10125124*k.^2)/625 + 4*r.^2).^(1/2) - 50*h.*k.^2)./(50*(k.^2 + 1));
p2y=-(25*k.*(- 4*h.^2 - (12728*h.*k)/25 + 4*k.^2.*r.^2 - (10125124*k.^2)/625 + 4*r.^2).^(1/2) - 3182*k + 50*h.*k.^2)./(50*(k.^2 + 1));