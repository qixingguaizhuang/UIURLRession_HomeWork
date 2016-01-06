//
//  CellOfContect.m
//  UIURLRession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfContect.h"
#import "ModelOfMtime.h"

@implementation CellOfContect



- (void)handleData:(ModelOfMtime *)model{

    self.labelView.text = model.title;

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
