%l---��,d---'��',s---��,h---���ľ����ϱ������,R---��뾶
d=40;s=80;R=[30,50,70,90,110];l=180; %����
recd=40;recs=80;recR=[90,120,150,180,210];recl=180; %������
h=1:0.5:150;
tarea=zeros(length(R),length(h));part=zeros(length(R),length(h)); %����
reca=zeros(length(R),length(h));recpart=zeros(length(R),length(h)); %������
for j=1:length(R)
    for i=1:length(h)
%         [tarea(j,i),part(j,i)]=totalarea(d,l,s,h(i)+R(j),R(j)); %����
         [reca(j,i),recpart(j,i)]=rectotalarea(recd,recl,recs,recR(j),h(i)); %������
    end
end
%_________�������__________%
% figure(1)
% plot(h,tarea,'linesmoothing','on');
% legend('R=30','R=50','R=70','R=90','R=110','Location','best');
% xlabel('h(mm)');ylabel('area(mm^2)');
% figure(2)
% plot(h,part,'linesmoothing','on');
% legend('R=30','R=50','R=70','R=90','R=110','Location','best');
% xlabel('h(mm)');ylabel('percentage');
% figure(3)
% temppart=tarea/(l*s);ptarea=zeros(length(R),length(h));
% ptarea(temppart>=1)=1;ptarea(temppart<1)=temppart(temppart<1);
% plot(h,ptarea,'linesmoothing','on');
% legend('R=30','R=50','R=70','R=90','R=110','Location','best');
% xlabel('h(mm)');ylabel('������');
%_________���������__________%
figure(4)
plot(h,reca,'linesmoothing','on');
legend('R=90','R=120','R=150','R=180','R=210','Location','best');
xlabel('h(mm)');ylabel('area(mm^2)');
figure(5)
plot(h,recpart,'linesmoothing','on');
legend('R=90','R=120','R=150','R=180','R=210','Location','best');
xlabel('h(mm)');ylabel('percentage');
figure(6)
temppart=reca/(l*s);preca=zeros(length(R),length(h));
preca(temppart>=1)=1;preca(temppart<1)=temppart(temppart<1);
plot(h,preca,'linesmoothing','on');
legend('R=90','R=120','R=150','R=180','R=210','Location','best');
xlabel('h(mm)');ylabel('������');



