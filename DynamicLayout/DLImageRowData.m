//
//  DLImageRowData.m
//  DynamicLayout
//
//  Created by zhangdl on 14-10-27.
//  Copyright (c) 2014年 zhangdl. All rights reserved.
//

#import "DLImageRowData.h"

@implementation DLImageRowData

- (id)init
{
    if (self = [super init]) {
        self.images = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
