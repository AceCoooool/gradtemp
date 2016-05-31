function [dismin,dismax]=plotdh(l1,l2,e,theta0,thetax,flag)
global ting;
ting=0;
[thetas,thetal]=limitSituation(l1,l2,e);
rthetas=rad2deg(thetas);raxis=zeros(1,4);
%为图形方便，设定比例系数，将图像中l2对于dl2=10
dl2=10;ratio=l2/dl2;dl1=l1/ratio;de=e/ratio;
l2=10;l1=dl1;e=de;
%初始化图形坐标轴范围
raxis(4)=fix((l1+l2)*sin(thetas))+3;raxis(3)=fix(-l1)-3;
raxis(1)=fix(-l1)-6;raxis(2)=raxis(4)-raxis(3)+raxis(1);

%初始化 初始角度及希望转过角度
if flag==0
    dtheta0=deg2rad(fix(rthetas)+10);
    dtheta=2*pi/3;
    if dtheta+dtheta0>thetal
        fprintf('所选择的尺寸不佳\n');
        dtheta=pi/2;
    end
end
if flag==1
    dtheta0=theta0;
    dtheta=thetax;
    if dtheta0+dtheta>thetal
        errordlg('你输入的theta不合理','输入错误');
    end
end
theta0=dtheta0;theta1=dtheta0+dtheta;
theta=theta0;thetatemp=acos((e-l1*cos(theta))/l2);
%设置坐标系范围
axis(raxis);
%设置滑块移动导轨
downmax=(l2-l1)*sin(thetal-pi)-1;
upmax=(l2+l1)*sin(thetas)+1;
hpy=[downmax,downmax,upmax,upmax];hp1x=[e-0.7,e-0.5,e-0.5,e-0.7];hp2x=[e+0.5,e+0.7,e+0.7,e+0.5];
patch(hp1x,hpy,[1,0.2,0.2],'EdgeColor','b');patch(hp2x,hpy,[1,0.2,0.2],'EdgeColor','b');
%初始情况三个点坐标
p0=line(0,0,'Color','b','Marker','.','MarkerSize',20);
p1=line(l1*cos(theta),l1*sin(theta),'Color','b','Marker','.','MarkerSize',20,'EraseMode','xor');
p2=line(e,l1*sin(theta)+l2*sin(thetatemp),'Color','b','Marker','.',...
    'MarkerSize',20,'EraseMode','xor');
%绘制曲柄轮廓线
t=0:0.01:2*pi;
c1=line(l1*sin(t),l1*cos(t),'LineWidth',1,'Color',[0.5,0.7,1]);
%点之间连接起来
arm1=line([0,l1*cos(theta)],[0,l1*sin(theta)],'LineWidth',5,'Color',[0.4,0.3,1],'EraseMode','xor');
arm2=line([l1*cos(theta),e],[l1*sin(theta),l1*sin(theta)+l2*sin(thetatemp)],...
    'LineWidth',5,'Color',[0.4,0.3,1],'EraseMode','xor');
%绘制滑块
point2y=l1*sin(theta)+l2*sin(thetatemp);
yh0=[point2y-0.7,point2y-0.7,point2y+0.7,point2y+0.7]';
xh0=[e-0.5,e+0.5,e+0.5,e-0.5]';
block=patch(xh0,yh0,'g','EdgeColor','b','EraseMode','xor');
%动画制作
dtheta=pi/50;
%视频导出
% writerObj=VideoWriter('qbhk.avi');
% open(writerObj);
% set(gca,'nextplot','replace'); 
while ting==0
    if theta>theta1||theta<theta0
        dtheta=-dtheta;
    end
    theta=theta+dtheta;thetatemp=acos((e-l1*cos(theta))/l2);
    x2=l1*cos(theta);y2=l1*sin(theta);
    x3=e;y3=l1*sin(theta)+l2*sin(thetatemp);
    xa1=[0,l1*cos(theta)];ya1=[0,l1*sin(theta)];
    xa2=[l1*cos(theta),e];ya2=[l1*sin(theta),l1*sin(theta)+l2*sin(thetatemp)];
    yh0=[y3-0.7,y3-0.7,y3+0.7,y3+0.7]';
    set(p1,'XData',x2,'YData',y2);
    set(p2,'XData',x3,'YData',y3);
    set(arm1,'XData',xa1,'YData',ya1);
    set(arm2,'XData',xa2,'YData',ya2);
    set(block,'XData',xh0,'YData',yh0);
    drawnow;pause(0.005);
    %导出视频
%     frame=getframe(gcf);
%     writeVideo(writerObj,frame);
end
%导出视频
% close(writerObj);
dismax=point2y*ratio;dismin=(l1*sin(theta1)+l2*sin(acos((e-l1*cos(theta1))/l2)))*ratio;
jiaodu=theta0:pi/100:theta1;
dis=(l1*sin(jiaodu)+l2*sin(acos((e-l1*cos(jiaodu))/l2)))*ratio;
figure(2);
plot(dis,jiaodu,'-','linesmoothing','on');
xlabel('滑块的距离S');ylabel('theta0到theta0+theta');
