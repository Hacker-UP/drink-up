//
//  DURecordObject.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DURecordObject.h"

@implementation DURecordObject

- (instancetype)initWithCapacity: (NSInteger)capacity level:(NSUInteger)level date:(NSDate *)date {
    self = [super init];
    if (self) {
        self.capacity = [self getCapacityLabelText: capacity];
        self.level = [self getLevelLabelText: level];
        self.date = [self getDateLabelText:date];
        self.levelNum = level;
    }
    return self;
}

- (NSString *)getDateLabelText: (NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd yyyy, HH:mm"];
    NSString *currentDateString = [formatter stringFromDate:date];
    return currentDateString;
}

- (NSString *)getCapacityLabelText:(NSInteger)capacity {
    return [NSString stringWithFormat:@"%ldmL", capacity];
}

- (NSString *)getLevelLabelText:(NSInteger)level {
    return [NSString stringWithFormat:@"Lv.%ld", level];
}

- (NSString *)getImageName {
    return [NSString stringWithFormat:@"tree-%ld", self.levelNum];
}

#pragma mark - NSCoding
- (void)encodingWithCoder: (NSCoder *)aCoder {
    [aCoder encodeObject:self.capacity forKey:@"capacity"];
    [aCoder encodeObject:self.level forKey:@"level"];
    [aCoder encodeObject:self.date forKey:@"date"];
}

- (id)initWithCoder: (NSCoder *)aDecoder {
    if (self = [super init]) {
        self.capacity = [aDecoder decodeObjectForKey:@"capacity"];
        self.level = [aDecoder decodeObjectForKey:@"level"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
    }
    return self;
}

#pragma mark - NSCoping
- (id)copyWithZone: (NSZone *)zone {
    DURecordObject *copy = [[[self class] allocWithZone:zone] init];
    copy.capacity = self.capacity;
    copy.level = self.level;
    copy.date = self.date;
    return copy;
}

@end
