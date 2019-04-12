//
//  CWLongPicController.m
//  CarWins
//
//  Created by mac on 2018/10/25.
//  Copyright © 2018年 CarWins Inc. All rights reserved.
//

#import "CWLongPicController.h"

@interface CWLongPicController ()<UIScrollViewDelegate>
{
	UIScrollView    *_showLongPV;
}
@end
@implementation CWLongPicController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预览长图";
	[self initUI];
}


#pragma mark - 长图展示
- (void)initUI
{
	_showLongPV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
	_showLongPV.backgroundColor = [UIColor whiteColor];
//	_showLongPV.delegate = self;
	_showLongPV.scrollEnabled = YES;
	[self.view addSubview:_showLongPV];
	
	//添加显示视图
	_showLongPV.contentSize = CGSizeMake(0, self.image.size.height);
	UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.image.size.width, self.image.size.height)];
	imageV.image = self.image;
	[_showLongPV addSubview:imageV];
}

#pragma mark - 滚动设置选择车辆视图的位置
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	
}







@end
