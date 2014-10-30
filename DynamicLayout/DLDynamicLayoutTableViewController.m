//
//  DLImageLayoutTableViewController.m
//  DynamicLayout
//
//  Created by zhangdl on 14-10-26.
//  Copyright (c) 2014年 zhangdl. All rights reserved.
//

#import "DLDynamicLayoutTableViewController.h"
#import "DLImageRowData.h"
#import "DLDynamicLayoutTableViewCell.h"

@interface DLDynamicLayoutTableViewController ()

@end

#define IMAGE_COUNT 16
#define MAX_WIDTH [UIScreen mainScreen].bounds.size.width
#define MAX_HEIGHT 200

@implementation DLDynamicLayoutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // add images
    self.imageList = [[NSMutableArray alloc] init];
    UIImage *image;
    
    for (int i = 1; i <= IMAGE_COUNT; i ++) {
        image = [UIImage imageNamed:[[NSString alloc] initWithFormat:@"%d", i]];
        [self.imageList addObject:image];
    }
    
    // show images
    [self layoutImageList];
    
    // add the slider to self.view
    self.heightMaxSlider.frame = CGRectMake(10, 64, 300, 20);
    [self.view addSubview:self.heightMaxSlider];
}

/// the Algorithms: http://blog.vjeux.com/2012/image/image-layout-algorithm-google-plus.html
- (void)layoutImageList
{
    self.imageRowList = [[NSMutableArray alloc] init];
    
    float height = 0;
    float rateSub = 0;
    DLImageRowData *rowData = [[DLImageRowData alloc] init];
    for (UIImage *image in self.imageList) {
        [rowData.images addObject:image];
        rateSub += image.size.width / image.size.height;
        height = MAX_WIDTH / rateSub;
        if (height <= self.heightMaxSlider.value) {
            rowData.height = height;
            [self.imageRowList addObject:rowData];
            rowData = [[DLImageRowData alloc] init];
            rateSub = 0;
        }
    }
    // the last
    if (rateSub != 0)
    {
        rowData.height = height;
        [self.imageRowList addObject:rowData];
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.imageRowList.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLImageRowData *rowData = [self.imageRowList objectAtIndex:indexPath.row];
    return rowData.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"ImageLayoutCell";
    DLDynamicLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    // Configure the cell...
    UIImageView *imageView;
    float width = 0;
    DLImageRowData *rowData = [self.imageRowList objectAtIndex:indexPath.row];
    for (int i = 0; i < cell.imageViews.count; i ++) {
        if (i < rowData.images.count) {
            UIImage *image = rowData.images[i];
            imageView = cell.imageViews[i];
            imageView.image = image;
            CGRect rect = CGRectMake(width, 0, rowData.height * image.size.width / image.size.height, rowData.height);
            imageView.frame = rect;
            width += rowData.height * image.size.width / image.size.height;
        }
        else /// avoid the image of the cell dislocation.
        {
            imageView = cell.imageViews[i];
            imageView.image = nil;
            imageView.frame = CGRectMake(0, 0, 0, 0);
        }
        
    }
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    /// let the slider scroll with the table view
    if ([aScrollView isEqual:self.tableView]) {
        self.heightMaxSlider.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
    }
}

- (IBAction)heightMaxSliderValueChanged:(id)sender {
    [self layoutImageList];
}
@end
