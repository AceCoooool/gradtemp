%���������޽Ƕ�: l1---�̱ߣ�l2---���ߣ�e---"���ľ�"
function [thetas,thetal]=limitSituation(l1,l2,e)
if (l2-l1)<=e
    fprintf('illegal input');
    return;
end
thetas=acos(e/(l2+l1));
thetal=acos(e/(l2-l1))+pi;
%fprintf('recommended theta0: theta>%f\n',rad2deg(thetas));
%fprintf('recommended theta: theta<%f\n',rad2deg(thetal-thetas));