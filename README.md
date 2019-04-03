## CWDrawLongPicture(绘制长图将页面内容绘制成一张图片）
====================<br>
##一、需求分析、实现
*需求*：(因为微信不支持多图片分享功能)将页面的显示内容绘制成一张照片，并且可以保存到相册；
*分析*：需要绘制的内容分为三部分：头部视图、内容部分、尾部视图;<br>个人想法：本来想要采用tableView、collectionView直接截屏的方法实现，但是最终生成长图片和页面显示的内容是不一致，所以需要一个个重新绘制;<br>
*实现过程*：首先将头部需要实现的部分拼接成一张图片，接着内容、尾部视图拼接；


##二、效果图
![image]



##三、代码实现

>UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, 1.0);   
CGContextRef context = UIGraphicsGetCurrentContext();   
[view.layer renderInContext:context];  
UIImage *endImage =     UIGraphicsGetImageFromCurrentImageContext();  
UIGraphicsEndImageContext();  
self.nImageView = endImage;

*绘制的长图有模糊的现象：* 解决方案

1）UIGraphicsBeginImageContextWithOptions(carInfoV.frame.size, true, [[UIScreen mainScreen] scale]);
2）UIGraphicsBeginImageContext(CGSizeMake(headImgW, headImgH+carImgH));
改为
UIGraphicsBeginImageContextWithOptions(CGSizeMake(headImgW, headImgH+carImgH), NO, [UIScreen mainScreen].scale);
