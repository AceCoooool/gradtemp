d=40;s=80;l=180;
h=10:0.5:150;
R=30:1:200;
% maxarea=zeros(size(R));maxpart=zeros(size(R));   %����
recmaxarea=zeros(size(R));recmaxpart=zeros(size(R));   %������
rectarea=zeros(size(h));rectpart=zeros(size(h));   %������
for j=1:length(R)
    for i=1:length(h)
%          [tarea,tpart]=totalarea(d,l,s,h(i)+R(j),R(j));%����
        [rectarea(i),rectpart(i)]=rectotalarea(d,l,s,2*R(j),h(i));  %������
%         if tarea>maxarea(j)    %����
%             maxarea(j)=tarea;maxpart(j)=tpart;   %����
%         else                         %����
%             break;               %����
%         end                      %����
    end
    recmaxarea(j)=max(rectarea);recmaxpart(j)=max(rectpart);  %������
end

% plot(R,recmaxarea,'b-',R,maxarea,'r-','linesmoothing','on')
% xlabel('�뾶R(mm)');ylabel('area(mm2)');
% legend('������','����','Location','best');
% plot(R,recmaxpart,'b-',R,maxpart,'r-','linesmoothing','on')
% xlabel('�뾶R(mm)');ylabel('percentage');
% legend('������','����','Location','best');