d=40;s=80;l=180;
h=10:0.5:150;
R=30:1:200;
% maxarea=zeros(size(R));maxpart=zeros(size(R));   %球体
recmaxarea=zeros(size(R));recmaxpart=zeros(size(R));   %立方体
rectarea=zeros(size(h));rectpart=zeros(size(h));   %立方体
for j=1:length(R)
    for i=1:length(h)
%          [tarea,tpart]=totalarea(d,l,s,h(i)+R(j),R(j));%球体
        [rectarea(i),rectpart(i)]=rectotalarea(d,l,s,2*R(j),h(i));  %立方体
%         if tarea>maxarea(j)    %球体
%             maxarea(j)=tarea;maxpart(j)=tpart;   %球体
%         else                         %球体
%             break;               %球体
%         end                      %球体
    end
    recmaxarea(j)=max(rectarea);recmaxpart(j)=max(rectpart);  %立方体
end

% plot(R,recmaxarea,'b-',R,maxarea,'r-','linesmoothing','on')
% xlabel('半径R(mm)');ylabel('area(mm2)');
% legend('立方体','球体','Location','best');
% plot(R,recmaxpart,'b-',R,maxpart,'r-','linesmoothing','on')
% xlabel('半径R(mm)');ylabel('percentage');
% legend('立方体','球体','Location','best');