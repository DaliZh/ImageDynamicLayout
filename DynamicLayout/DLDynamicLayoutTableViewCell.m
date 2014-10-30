//
//  DLImageLayoutTableViewCell.m
//  DynamicLayout
//
//  Created by zhangdl on 14-10-26.
//  Copyright (c) 2014年 zhangdl. All rights reserved.
//

#import "DLDynamicLayoutTableViewCell.h"

@implementation DLDynamicLayoutTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.imageViews = [[NSMutableArray alloc] initWithObjects:self.imageView1, self.imageView2, self.imageView3, self.imageView4, self.imageView5, nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
