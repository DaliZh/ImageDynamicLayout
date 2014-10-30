//
//  ZLImageLayoutTableViewCell.h
//  DynamicLayout
//
//  Created by zhangdl on 14-10-26.
//  Copyright (c) 2014年 zhangdl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLDynamicLayoutTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
@property (weak, nonatomic) IBOutlet UIImageView *imageView5;

@property (nonatomic, retain) NSMutableArray *imageViews;
@end
