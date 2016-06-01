# 临时仓库
##曲柄滑块机构(qbhk文件夹)
主要matlab文件说明：  
GUIqubingyaogan.m——主文件，直接打开运行即可。  
GUIqubingyaogan.fig——GUI界面(绘制用)  
plotdh.m——制作动画的核心程序  
limitSituation.m——求两个极限角  

主要细节说明：  
未自定义theta时，theta0默认略大于极限角1，theta默认为120°  
最远最近距离需物体至少运动“一个周期”再按停止才会精确  
如需将动画导出，去掉plotdh内的“%导出视频”下面内容的注释

##四杆机构(sgjg文件夹)
这一部分参考了[RobinCPC所写的Fourbar_GUI](https://github.com/RobinCPC/Fourbar_GUI)。  
主要matlab文件说明：  
fourbarGUI.m——主文件，直接打开运行即可  
fourbarGUI.fig——GUI界面  
FourbarInfo.jpg——四杆机构信息图  

主要细节说明：  
输入角度theta0为与x=0正方向夹脚，取负值。theta为执行杆转过的角度  
框架角度为框架与x轴的夹角  
如需导出动画，去掉“%导出视频”下面内容的注释


##包覆分析(bffx文件夹)
主要matlab文件说明：  
main.m——主文件，绘制出5种不同R情况下球体和立方体的包覆率，包覆面积，利用率与高度h之间的关系，针对不同的R情况，只需自行改变R内的取值。（“%球体”，“%立方体”分别代表各自情况）  
'''''与球体相关部分'''''  
totalarea.m——计算给定参数情况下总包覆面积及包覆率  
limittheta2.m——计算极限包覆情况时的角度  
yuan.m——计算不同半径时，圆与极限直线的包覆长度  
cnnpoint.m——计算圆与极限直线的交点坐标，由solve函数求解得解析式。  
'''''与立方体相关部分'''''  
rectotalarea.m——计算给定参数情况下总包覆面积及包覆率  
recarea.m——计算正方形与极限直线的包覆长度  
reclimittheta.m——计算极限包覆情况时的角度  

主要细节说明:  
当选取不同的“离心距E1时”，可采用下式求解具体的解析式：  
syms x y r k h;  
[solx,soly]=solve([x^2+(y+h)^2==r^2, k*(x+E1)==y],x,y);  
syms k1 h1 r1;  
tempk=solve((k1*E1+h1)^2/(k1^2+1)==r1^2,k1);  


  