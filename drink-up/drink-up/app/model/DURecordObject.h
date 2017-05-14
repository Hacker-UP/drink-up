//
//  DURecordObject.h
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DURecordObject : NSObject

@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *capacity;
@property (assign) NSInteger levelNum;

- (instancetype)initWithCapacity: (NSInteger)capacity level:(NSUInteger)level date:(NSDate *)date;
- (void)encodingWithCoder: (NSCoder *)aCoder;
- (id)initWithCoder: (NSCoder *)aDecoder;
- (id)copyWithZone: (NSZone *)zone;
- (NSString *)getImageName;

@end
