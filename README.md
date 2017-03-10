# IDCardRecognition

## 说明
一个近乎完整的可识别中国身份证信息的Demo
可快速读出身份证上的信息（姓名、性别、民族、住址、身份证号码）并截取到身份证图像

![首页](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/1.PNG?raw=true)
![拍摄界面](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/2.PNG?raw=true)
![读取到信息](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/3.PNG?raw=true)
## 原理
经实践发现，只要身份证号码处于摄像头预览图层中时，即不用完全对准身份证也可以读取到身份证号码，但此时截取到的身份证图像并不完整。

为获取到比较完整的身份证图像，经多次实践发现，当身份证人像大约位于拍摄框右上区域时，此时可获取到比较完整的身份证图像。

因此，在拍摄框中右上区域加了一个人像区域提示框，并将该区域设为扫描人脸的区域，只有该区域扫描到身份证上的人脸时（确保用户的确将身份证人像对准了拍摄框中的人像框），才执行读取身份证信息的操作。
## 使用
将该功能集成到你开发的app里:

1、请把Category、Tool、libexidcard、Model、View、Controller这六个文件夹拖入到你的项目里；

2、将idcard_first.png、idcard_first_head.png、idcard_back.png、navigationbar_back.png拖入到你的项目中

3、在你的项目的Info.plist文件中，添加权限描述（Key   Value）

Privacy - Camera Usage Description      是否允许访问相机

Privacy - Photo Library Usage Description       是否允许访问相册

4、运行程序，可能会报错：

![ENABLE_BITCODE Error](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/ENABLE_BITCODE%20Error.png?raw=true)

解决方法：

![ENABLE_BITCODE Error 解决方法](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/ENABLE_BITCODE%20Error%20解决方法.png?raw=true)

5、大功告成，😄 Run! 
