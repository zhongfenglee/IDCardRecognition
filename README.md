# IDCardRecognition

## 说明
一个近乎完整的可识别中国身份证信息的Demo

可自动快速读出身份证上的信息（姓名、性别、民族、住址、身份证号码）并截取到身份证图像

![IDAuthViewController-开始验证身份证](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/1.PNG?raw=true)
![AVCaptureViewController-拍摄界面](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/2.PNG?raw=true)
![IDInfoViewController-身份证信息界面](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/3.PNG?raw=true)
## 原理
经实践发现，只要身份证号码处于摄像头预览图层中时，即不用完全对准身份证也可以读取到身份证号码，但此时截取到的身份证图像并不完整。

为获取到比较完整的身份证图像，经多次实践发现，当身份证人像大约位于拍摄框中的右上区域时，此时可获取到比较完整的身份证图像。

因此，在拍摄框中右上区域加了一个人像区域提示框，并将该区域设为扫描人脸的区域，只有该区域扫描到身份证上的人脸时（确保用户的确将身份证人像对准了拍摄框中的人像框），才执行读取身份证信息的操作。
## 使用
将该功能集成到你开发的app里:

1、请把Category、Tool、libexidcard、Model、View、Controller这六个文件夹拖入到你的项目里；

2、将idcard_first.png、idcard_first_head.png、idcard_back.png、nav_back.png、nav_torch_on.png、nav_torch_off.png拖入到你的项目中，或在相应代码处替换为你的素材；

3、在你的项目的Info.plist文件中，添加权限描述（Key   Value）

Privacy - Camera Usage Description      是否允许访问相机

Privacy - Photo Library Usage Description       是否允许访问相册

4、运行程序，可能会报 ENABLE_BITCODE 错误：

![ENABLE_BITCODE Error](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/ENABLE_BITCODE%20Error.png?raw=true)

解决方法：

![ENABLE_BITCODE Error 解决方法](https://github.com/zhongfenglee/IDCardRecognition/blob/master/Screenshot/ENABLE_BITCODE%20Error%20解决方法.png?raw=true)

5、在你的项目中的相应处，首先：

`#import "IDAuthViewController.h"`

在使用该功能的地方：

`IDAuthViewController *IDAuthVC = [[IDAuthViewController alloc] init];`

`[self.navigationController pushViewController:IDAuthVC animated:YES];`

6、大功告成，使用真机，Run! 😄 
## 特别鸣谢
本Demo扫描身份证的代码参考自[mxl123/IDAndBankCard](https://github.com/mxl123/IDAndBankCard)，非常感谢[mxl123](https://github.com/mxl123)的开源，再次表示致谢和敬意！
## 联系我
如果您觉得本Demo好用，请为我加星，非常感谢，🙏！&nbsp;如果您有什么疑问/建议，非常欢迎联系我，🙏！

QQ/微信: 852354291&nbsp;&nbsp;&nbsp;&nbsp;Email: 852354291@qq.com

Please Star Me, Follow Me, Thank You!😊
