//
//  RPButton.m
//  RPFootball
//
//  Created by Mac on 2016/11/21.
//  Copyright © 2016年 RP. All rights reserved.
//

#import "RPButton.h"

#import "Masonry.h"

@interface RPButton ()

@property (nonatomic, strong) UILabel *RPLabel;
@property (nonatomic, strong) UIImageView *RPImageView;

@end

@implementation RPButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self titleLabel:frame];
        [self imageView:frame];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    self.RPLabel.text = title;
    CGRect tempFrame = self.RPLabel.frame;
    tempFrame.size.width = self.frame.size.width - 10;
    self.RPLabel.frame = tempFrame;
}

- (void)setTitleColor:(UIColor *)titleColor {
    self.RPLabel.textColor = titleColor;
}

- (void)setImageName:(NSString *)imageName {
    self.RPImageView.image = [UIImage imageNamed:imageName];
}

- (void)titleLabel:(CGRect)frame {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - 10, frame.size.height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    [self addSubview:label];
    self.RPLabel = label;
}

- (void)imageView:(CGRect)frame {
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(7);
        make.height.offset(5);
        make.right.equalTo(self.mas_right).offset(-5);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    self.RPImageView = imageView;
}

@end
