//
//  DLImageLayoutTableViewController.h
//  DynamicLayout
//
//  Created by zhangdl on 14-10-26.
//  Copyright (c) 2014年 zhangdl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLDynamicLayoutTableViewController : UITableViewController

/// the images
@property (nonatomic, retain) NSMutableArray* imageList;

/// the images in one row
@property (nonatomic, retain) NSMutableArray* imageRowList;

// the height of the max of height
@property (strong, nonatomic) IBOutlet UISlider *heightMaxSlider;

- (IBAction)heightMaxSliderValueChanged:(id)sender;
@end
