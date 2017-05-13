//
//  DUUserDefaultHelper.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUUserDefaultHelper.h"

@implementation DUUserDefaultHelper

+ (void)writeData: (DURecordObject *)record {
    NSMutableArray<DURecordObject *> *array = [DUUserDefaultHelper readData];
    [array addObject:record];
    NSMutableArray<NSDictionary *> *res = @[].mutableCopy;
    for (DURecordObject *obj in array) {
        NSDictionary *dic = @{
                              @"capacity": obj.capacity,
                              @"date": obj.date,
                              @"level": obj.level,
                              };
        [res addObject:dic];
    }
    NSString *cachePatch = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [cachePatch stringByAppendingPathComponent:@"data.plist"];
    [res writeToFile:filePath atomically:YES];
}

+ (NSMutableArray<DURecordObject *> *)readData {
    NSString *cachePatch = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [cachePatch stringByAppendingPathComponent:@"data.plist"];
    NSArray<NSDictionary *> *datas = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray<DURecordObject *> *res = @[].mutableCopy;
    for(NSDictionary *data in datas) {
        DURecordObject *obj = [[DURecordObject alloc] init];
        obj.capacity = data[@"capacity"];
        obj.date = data[@"date"];
        obj.level = data[@"level"];
        
        [res addObject:obj];
    }
    return res;
}

@end
