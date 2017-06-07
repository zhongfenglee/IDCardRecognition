//
//  IDInfo.m
//  BankCard
//
//  Created by XAYQ-FanXL on 16/7/8.
//  Copyright © 2016年 AN. All rights reserved.
//

#import "IDInfo.h"

@implementation IDInfo

/*
- (BOOL)isEqual:(IDInfo *)idInfo {
    if (idInfo == nil) {
        return NO;
    }
    
    if (_type == 1) {
        if ((_type == idInfo.type)
            && [_num isEqualToString:idInfo.num]
            && [_name isEqualToString:idInfo.name]
            && [_gender isEqualToString:idInfo.gender]
            && [_nation isEqualToString:idInfo.nation]
            && [_address isEqualToString:idInfo.address]) {
            
            return YES;
        }
    } else if (_type == 2) {
        if ([_issue isEqualToString:idInfo.issue]
            && [_valid isEqualToString:idInfo.valid]) {
            
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)isOK {
    if (_num != nil
        && _name!= nil
        && _gender!= nil
        && _nation!= nil
        && _address!= nil) {
        
        if (_num.length>0
            && _name.length > 0
            && _gender.length > 0
            && _nation.length > 0
            && _address.length > 0) {
            
            return YES;
        }
    } else if (_issue != nil
               && _valid!= nil) {
        
        if (_issue.length > 0
            && _valid.length > 0) {
            
            return YES;
        }
    }
    
    return NO;
}
 */

//-(NSString *)description {
//    return [NSString stringWithFormat:@"<%@>",@{@"姓名：":_name,@"性别：":_gender,@"民族：":_nation,@"住址：":_address,@"公民身份证：":_num}];
//}


@end
