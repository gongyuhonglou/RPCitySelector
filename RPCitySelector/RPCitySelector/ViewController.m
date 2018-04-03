//
//  ViewController.m
//  RPCitySelector
//
//  Created by mac on 2016/11/3.
//  Copyright © 2016年 WRP. All rights reserved.
//

#import "ViewController.h"

#import "RPLocation.h"
#import "RPAreaDataManager.h"
#import "RPCityViewController.h"

#define KCURRENTCITYINFODEFAULTS [NSUserDefaults standardUserDefaults]

@interface ViewController ()<RPLocationDelegate, RPCityViewControllerDelegate>

/** 选择的结果*/
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
/** 城市定位管理器*/
@property (nonatomic, strong) RPLocation *locationManager;
/** 城市数据管理器*/
@property (nonatomic, strong) RPAreaDataManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[RPLocation alloc] init];
    _locationManager.delegate = self;
}

- (RPAreaDataManager *)manager {
    if (!_manager) {
        _manager = [RPAreaDataManager shareInstance];
        [_manager areaSqliteDBData];
    }
    return _manager;
}

- (IBAction)didClickedButtonEvent:(UIButton *)sender {
    RPCityViewController *cityViewController = [[RPCityViewController alloc] init];
    cityViewController.delegate = self;
    cityViewController.title = @"城市";
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:cityViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - RPCityViewControllerDelegate
- (void)cityName:(NSString *)name {
    _resultLabel.text = name;
}

#pragma mark --- RPLocationDelegate
//定位中...
- (void)locating {
    NSLog(@"定位中...");
}

//定位成功
- (void)currentLocation:(NSDictionary *)locationDictionary {
    NSString *city = [locationDictionary valueForKey:@"City"];
    if (![_resultLabel.text isEqualToString:city]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"您定位到%@，确定切换城市吗？",city] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _resultLabel.text = city;
            [KCURRENTCITYINFODEFAULTS setObject:city forKey:@"locationCity"];
            [KCURRENTCITYINFODEFAULTS setObject:city forKey:@"currentCity"];
            [self.manager cityNumberWithCity:city cityNumber:^(NSString *cityNumber) {
                [KCURRENTCITYINFODEFAULTS setObject:cityNumber forKey:@"cityNumber"];
            }];
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

/// 拒绝定位
- (void)refuseToUsePositioningSystem:(NSString *)message {
    NSLog(@"%@",message);
}

/// 定位失败
- (void)locateFailure:(NSString *)message {
    NSLog(@"%@",message);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

