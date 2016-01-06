//
//  handelDataURL.h
//  UIURLRession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol handelDataOfURLDelegate <NSObject>

- (void)handelDataOfURL:(NSURL *)url;

@end

@interface handelDataURL : NSObject

@property (nonatomic, retain)id <handelDataOfURLDelegate> delegate;

@end
