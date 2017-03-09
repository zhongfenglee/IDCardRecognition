//
//  RectManager.m
//  BankCard
//
//  Created by XAYQ-FanXL on 16/7/8.
//  Copyright © 2016年 AN. All rights reserved.
//

#import "RectManager.h"

char numbers[256];
CGRect rects[64]; 

@implementation RectManager

+ (CGRect)getEffectImageRect:(CGSize)size {
    CGSize size2 = [UIScreen mainScreen].bounds.size;
    CGPoint point;
    if(size.width/size.height > size2.width/size2.height) {
        float oldW = size.width;
        size.width = size2.width / size2.height * size.height;
        point.x = (oldW - size.width)/2;
        point.y = 0;
    }
    else {
        float oldH = size.height;
        size.height = size2.height / size2.width * size.width;
        point.x = 0;
        point.y = (oldH - size.height)/2;;
    }
    return CGRectMake(point.x, point.y, size.width, size.height);
}

+ (CGRect)getGuideFrame:(CGRect)rect {
    float previewWidth = rect.size.height;
    float previewHeight = rect.size.width;
    
    float cardh, cardw;
    float left, top;
    
    cardw = previewWidth*70/100;
    //if(cardw < 720) cardw = 720;
    if(previewWidth < cardw)
        cardw = previewWidth;
    
    cardh = (int)(cardw / 0.63084f);
    
    left = (previewWidth-cardw)/2;
    top = (previewHeight-cardh)/2;
    
    return CGRectMake(top+rect.origin.x, left+rect.origin.y, cardh, cardw);
}


+ (int)docode:(unsigned char *)pbBuf len:(int)tLen {
    int hic, lwc;
    int i, j, code;
    int x, y, w, h;
    int charCount = 0;
    
    int charNum = 0;
    char szBankName[128];
    
    //字符解析，包含空格
    i = 0;
    hic = pbBuf[i++]; lwc = pbBuf[i++]; code = (hic<<8)+lwc;
    hic = pbBuf[i++]; lwc = pbBuf[i++]; code = (hic<<8)+lwc;
    
    //bank name, GBK CharSet;
    for(j = 0; j < 64; ++j) { szBankName[j] = pbBuf[i++]; }
    
    //charNum
    hic = pbBuf[i++]; lwc = pbBuf[i++]; code = (hic<<8)+lwc;
    charNum = code;
    
    //char code and its rect
    while(i < tLen-9){
        //字符的编码unsigned short
        hic = pbBuf[i++]; lwc = pbBuf[i++]; x = (hic<<8)+lwc;
        numbers[charCount] = (char)x;
        //字符的矩形框lft, top, w, h
        hic = pbBuf[i++]; lwc = pbBuf[i++]; x = (hic<<8)+lwc;
        hic = pbBuf[i++]; lwc = pbBuf[i++]; y = (hic<<8)+lwc;
        hic = pbBuf[i++]; lwc = pbBuf[i++]; w = (hic<<8)+lwc;
        hic = pbBuf[i++]; lwc = pbBuf[i++]; h = (hic<<8)+lwc;
        rects[charCount] = CGRectMake(x, y, w, h);
        charCount++;
    }
    numbers[charCount] = 0;
    
    if(charCount < 10 || charCount > 24 || charNum != charCount){
        charCount = 0;
    }
    return charCount;
}

+ (CGRect)getCorpCardRect:(int)width  height:(int)height guideRect:(CGRect)guideRect charCount:(int) charCount {
    CGRect subRect = rects[0];
    
    int i;
    int nAvgW = 0;
    int nAvgH = 0;
    int nCount = 0;

    nAvgW  = rects[0].size.width;
    nAvgH  = rects[0].size.height;
    nCount = 1;
    //所有非空格的字符的矩形框合并
    for(i = 1; i < charCount; ++i){
        
        subRect = combinRect(subRect, rects[i]);
        if(numbers[i] != ' '){
            nAvgW += rects[i].size.width;
            nAvgH += rects[i].size.height;
            nCount ++;
        }
    }
    //统计得到的平均宽度和高度
    nAvgW /= nCount;
    nAvgH /= nCount;
    
    //releative to the big image（相对于大图）
    subRect.origin.x = subRect.origin.x + guideRect.origin.x;
    subRect.origin.y = subRect.origin.y + guideRect.origin.y;
    //    rect.offset(guideRect.left, guideRect.top);
    //做一个扩展
    subRect.origin.y -= nAvgH;  if(subRect.origin.y < 0) subRect.origin.y = 0;
    subRect.size.height += nAvgH * 2; if(subRect.size.height+subRect.origin.y  >= height) subRect.size.height = height-subRect.origin.y-1;
    subRect.origin.x -= nAvgW; if(subRect.origin.x < 0) subRect.origin.x = 0;
    subRect.size.width += nAvgW * 2; if(subRect.size.width+subRect.origin.x >= width) subRect.size.width = width-subRect.origin.x-1;
    return subRect;
}

+ (char *)getNumbers {
    return numbers;
}

CGRect combinRect(CGRect A, CGRect B)
{
    CGFloat t,b,l,r;
    l = fminf(A.origin.x, B.origin.x);
    r = fmaxf(A.size.width+A.origin.x, B.size.width+B.origin.x);
    t = fminf(A.origin.y, B.origin.y);
    b = fmaxf(A.size.height+A.origin.y, B.size.height+B.origin.y);
    
    return CGRectMake(l, t, r-l, b-t);
}


@end
