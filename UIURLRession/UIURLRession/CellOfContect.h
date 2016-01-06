//
//  CellOfContect.h
//  UIURLRession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelOfMtime;

@interface CellOfContect : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelView;

- (void)handleData:(ModelOfMtime *)model;


@end
