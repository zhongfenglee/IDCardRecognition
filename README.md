# IDCardRecognition
一个近乎完整的可识别中国身份证信息的Demo

可快速读出身份证上的信息（姓名、性别、民族、住址、身份证号码）并截取身份证照片

若想将该功能集成到你开发的app里:

1、请把Category、Tool、libexidcard、Model、View、Controller这六个文件夹拖入到你的项目里；

2、在你的项目的Info.plist文件中，添加权限描述（Key   Value）

Privacy - Camera Usage Description      是否允许访问相机

Privacy - Photo Library Usage Description       是否允许访问相册
