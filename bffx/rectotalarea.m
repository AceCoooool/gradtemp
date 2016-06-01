function [tarea,part]=rectotalarea(d,l,s,r,h)
if s<=r
    tarea=s*recarea(d,l,r,h);
else
    [a,sq]=recarea(d,l,r,h);
    %tarea=r*a+2*sq;
    tarea=r*a;
end
part=tarea/(6*r^2);