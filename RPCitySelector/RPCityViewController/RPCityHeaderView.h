//
//  RPCityHeaderView.h
//  RPFootball
//
//  Created by Mac on 2016/11/21.
//  Copyright © 2016年 RP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RPCityHeaderViewDelegate <NSObject>

- (void)cityNameWithSelected:(BOOL)selected;
- (void)beginSearch;
- (void)endSearch;
- (void)searchResult:(NSString *)result;
@end

@interface RPCityHeaderView : UIView

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, weak) id<RPCityHeaderViewDelegate> delegate;

/// 取消搜索
- (void)cancelSearch;
@end
