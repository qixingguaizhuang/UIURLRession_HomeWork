//
//  handelDataURL.m
//  UIURLRession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "handelDataURL.h"

@implementation handelDataURL


- (void)handelDataOfURL:(NSURL *)url1{


    
    // URL
    
    NSURL *url = [NSURL URLWithString:@"url1"];
    
    // 创建 session 建通道
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    // 创建任务 (task)
    
    /** block 解析*/
    NSURLSessionDataTask *task =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        
        // data 进行解析 (JSON格式)
        NSError *errorJson = nil;
        
        id resule = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorJson];
        
        NSLog(@"%@", resule);
    
    // 开始任务
    [task resume];
    
    }];

}


@end
