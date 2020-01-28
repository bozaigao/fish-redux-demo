//
//  RsaAndBase64.m
//  Mobispot
//  RsaAndBase64加密
//  Created by bozaigao on 2017/6/21.
//  Copyright © 2017年 Facebook. All rights reserved.
#import "RsaAndBase64.h"
#import "RSAEncryptor.h"
//处于业务安全考虑，该公钥已被隐藏
#define public_key @"xxx"
@implementation RsaAndBase64

/**
 *调用原生模块进行rsa加密和base64编码
 */
+ (NSString*) rsaAndBase64Encode:(NSString *) plaint
{
  NSString *encryptStr = [RSAEncryptor encryptString:plaint publicKey:public_key];
    NSLog(@"加密后的数据为: %@", encryptStr);
    return encryptStr;
}

/**
 *调用原生模块base64解码
 */
+ (NSString*) decryptByPublicKey:(NSString *) plaint
{
  NSData *plaint_data =
  [plaint dataUsingEncoding:NSUTF8StringEncoding];
  NSData *nsdataDecoded = [plaint_data initWithBase64EncodedData:plaint_data options:0];
  NSString *str = [[NSString alloc] initWithData:nsdataDecoded encoding:NSUTF8StringEncoding];
  NSLog(@"解密后的数据为: %@", str);
    return str;
}
@end
