# 临时仓库
##曲柄滑块机构
主要matlab文件说明：  
GUIqubingyaogan.m——主文件，直接打开运行即可。  
GUIqubingyaogan.fig——GUI界面(绘制用)  
plotdh.m——制作动画的核心程序  
limitSituation.m——求两个极限角  

主要细节说明：  
未自定义theta时，theta0默认略大于极限角1，theta默认为120°  
最远最近距离需物体至少运动“一个周期”再按停止才会精确  
如需将动画导出，去掉plotdh内的“%导出视频”下面内容的注释
