//
//  RPSearchView.h
//  RPFootball
//
//  Created by Mac on 2016/11/24.
//  Copyright © 2016年 RP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RPSearchViewDelegate <NSObject>

- (void)searchResults:(NSDictionary *)dic;
- (void)touchViewToExit;
@end

@interface RPSearchView : UIView

/** 搜索结果*/
@property (nonatomic, strong) NSMutableArray *resultMutableArray;
@property (nonatomic, weak) id<RPSearchViewDelegate> delegate;
@end
