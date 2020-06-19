//
//  LeakViewController.m
//  MLeaksFinder-Example
//
//  Created by Rake Yang on 2020/6/19.
//  Copyright © 2020 zeposhe. All rights reserved.
//

#import "LeakViewController.h"

@interface LeakObject : NSObject

@property (nonatomic, strong) id relation;
@property (nonatomic, strong) LeakObject *leak;


@end

@implementation LeakObject

@end

@interface LeakViewController ()

@property (nonatomic, strong) LeakObject *object;


@end

@implementation LeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提醒" message:@"这个是拿来内存泄露测试的" preferredStyle:UIAlertControllerStyleAlert];
    self.object = [LeakObject new];
    self.object.leak = [LeakObject new];
    self.object.leak.relation = self;
    [alertVC addAction:[UIAlertAction actionWithTitle:@"保持循环" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@", self.object.leak.relation);
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"打破循环" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.object.leak.relation = nil;
        NSLog(@"%@", self.object.relation);
    }]];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
