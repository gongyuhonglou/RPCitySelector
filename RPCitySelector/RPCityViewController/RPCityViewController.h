//
//  RPCityViewController.h
//  RPFootball
//
//  Created by Mac on 2016/11/21.
//  Copyright © 2016年 RP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RPCityViewControllerDelegate <NSObject>

- (void)cityName:(NSString *)name;

@end

@interface RPCityViewController : UIViewController

@property (nonatomic, weak) id<RPCityViewControllerDelegate> delegate;
@end
