//
//  RPLocation.h
//  Football
//
//  Created by Mac on 16/6/7.
//  Copyright © 2016年 RP. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RPLocationDelegate <NSObject>

/// 定位中
- (void)locating;

/**
 当前位置

 @param locationDictionary 位置信息字典
 */
- (void)currentLocation:(NSDictionary *)locationDictionary;

/**
 拒绝定位后回调的代理

 @param message 提示信息
 */
- (void)refuseToUsePositioningSystem:(NSString *)message;

/**
 定位失败回调的代理

 @param message 提示信息
 */
- (void)locateFailure:(NSString *)message;

@end

@interface RPLocation : NSObject

@property (nonatomic, weak) id<RPLocationDelegate> delegate;
@end
