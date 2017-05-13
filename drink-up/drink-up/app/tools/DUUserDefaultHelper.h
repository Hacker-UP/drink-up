//
//  DUUserDefaultHelper.h
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DURecordObject.h"

@interface DUUserDefaultHelper : NSObject

+ (void)writeData: (DURecordObject *)record;
+ (NSMutableArray<DURecordObject *> *)readData;

@end
