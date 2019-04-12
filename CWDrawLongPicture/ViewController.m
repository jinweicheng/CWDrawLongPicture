//
//  ViewController.m
//  CWDrawLongPicture
//
//  Created by 程金伟 on 2018/10/28.
//  Copyright © 2018年 cjw. All rights reserved.
//

#import "ViewController.h"
/**< 头部视图cell */
#import "CWSpecialHeaderView.h"
/**< 车辆大图cell */
#import "CWBigSpecialPushCarCell.h"
/**< 生成长图 */
#import "CWLongPicController.h"

static NSString *const KCWBigSpecialPushCarCell = @"CWBigSpecialPushCarCell_Dis";
static NSString *const KCWSpecialHeaderView = @"CWSpecialHeaderView_Dis";
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
	UICollectionView *_collectionView;
	CGFloat _spliceImgW;
	CGFloat _spliceImgH;
}
/**< 拼接的图 */
@property (nonatomic, strong)  UIImage *nImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationItem.title = @"绘制长图";
	[self initUI];
}


#pragma mark - 初始化UI
- (void)initUI
{
	_collectionView  = [self  createCollectionViewWithFrame:CGRectMake(0,64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-80)
												  LineSpace:1
													 vSpace:1
										   scrollDirecation:UICollectionViewScrollDirectionVertical];
	
	[self.view addSubview:_collectionView];
	
	UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
	[rightBtn setTitle:@"长图" forState:UIControlStateNormal];
	[rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}



#pragma mark -- Collection delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return 3;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
				  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return CGSizeMake([UIScreen mainScreen].bounds.size.width, 290);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
						layout:(UICollectionViewLayout *)collectionViewLayout
		insetForSectionAtIndex:(NSInteger)section{
	return UIEdgeInsetsMake(0, 0, 1, 0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
				  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	
	CWBigSpecialPushCarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KCWBigSpecialPushCarCell
								  forIndexPath:indexPath];
	NSInteger index = indexPath.row + 2;
	cell.backImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd.jpg",index]];
	cell.backImage.backgroundColor = [UIColor redColor];
	cell.modelNameL.text = @"测试| 测试 | 测试";
	cell.nPriceL.text = @"价格";
	return cell;
	
}

//headerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
	
	CWSpecialHeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KCWSpecialHeaderView forIndexPath:indexPath];
	
	//头部视图赋值KImage_WorkK
	headerV.backImage.image = [UIImage imageNamed:@"1.jpg"];
	headerV.groupNameL.text = @"组织name";
	headerV.groupAddressL.text = @"地址";
	headerV.telephoneL.text = @"电话";
	headerV.recommendCarL.text = @"为您精选3辆好车";
	return headerV;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
	return CGSizeMake([UIScreen mainScreen].bounds.size.width, 290);
}


#pragma mark - 创建UICollectionView
- (UICollectionView *)createCollectionViewWithFrame:(CGRect)frame
										  LineSpace:(NSInteger)line
											 vSpace:(NSInteger)space
								   scrollDirecation:(UICollectionViewScrollDirection)direcation
{
	
	self.automaticallyAdjustsScrollViewInsets = NO;
	UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
	fl.minimumInteritemSpacing = space;
	fl.minimumLineSpacing = line;
	[fl setScrollDirection:direcation];
	
	UICollectionView * collection = [[UICollectionView alloc]initWithFrame:frame
													  collectionViewLayout:fl];
	collection.delegate = self;
	collection.dataSource = self;
	[collection registerNib:[UINib nibWithNibName:@"CWBigSpecialPushCarCell"
										   bundle:nil] forCellWithReuseIdentifier:KCWBigSpecialPushCarCell];
	[collection registerNib:[UINib nibWithNibName:@"CWSpecialHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KCWSpecialHeaderView];
	collection.backgroundColor = [UIColor whiteColor];
	
	return collection;
}


- (void)clickRightBtn
{
	CWLongPicController *VC = [[CWLongPicController alloc] init];
	[self splicedCarImageView];
	VC.image = self.nImageView;
	[self.navigationController pushViewController:VC animated:YES];
}

//1、头部视图专题图+为您精选3辆好车
- (UIImage *)splicedheadImgView
{
	
	//1-1、头部视图
	UIImage *image = [UIImage imageNamed:@"1.jpg"];
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, image.size.height + 50)];
	UIImageView *headImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, image.size.height)];
	headImageV.image = image;
	
	[view addSubview:headImageV];
	//1-2、精选车辆文字
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,image.size.height,[UIScreen mainScreen].bounds.size.width,50)];
	label.text = [NSString stringWithFormat:@"-----为您精选3辆好车-----"];
	label.font = [UIFont fontWithName:@"Arial" size:16];
	label.textAlignment = NSTextAlignmentCenter;
	label.backgroundColor = [UIColor blackColor];
	label.textColor = [UIColor whiteColor];
	[view addSubview:label];
	//1-3、合成图片[UIScreen mainScreen].scale
	UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, 1.0);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[view.layer renderInContext:context];
	UIImage *endImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	self.nImageView = endImage;
	_spliceImgW = endImage.size.width;
	_spliceImgH = endImage.size.height;
	headImageV.layer.contents = nil;
	return endImage;
	
}


//2、车辆拼接成的图片
- (void)splicedCarImageView
{
	[self splicedheadImgView];
	for (int i = 1; i < 4; i ++) {
		
		CGFloat height = (300+100) * 0;
		UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
		UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, height,[UIScreen mainScreen].bounds.size.width, 400)];
		//1-1、图片视图
		UIImageView *headImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, height, [UIScreen mainScreen].bounds.size.width, 300)];
		headImageV.image = image;
		[view addSubview:headImageV];
		//1-2、车型文字
		UILabel *labelModel = [[UILabel alloc] initWithFrame:CGRectMake(20,300+height,[UIScreen mainScreen].bounds.size.width-20,30)];
		labelModel.text = @"车型";
		labelModel.font = [UIFont systemFontOfSize:16];
		labelModel.textAlignment = NSTextAlignmentLeft;
		labelModel.textColor = [UIColor whiteColor];
		[view addSubview:labelModel];
		
		//1-3、车辆信息
		UILabel *carL = [[UILabel alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(labelModel.frame)+2,[UIScreen mainScreen].bounds.size.width-20,25)];
		carL.text = @"测试| 测试 | 测试";
		carL.font = [UIFont systemFontOfSize:16];
		carL.textColor = [UIColor whiteColor];
		carL.textAlignment = NSTextAlignmentLeft;
		[view addSubview:carL];
		
		//1-4、车辆价格
		UILabel *priceL = [[UILabel alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(carL.frame)+2,[UIScreen mainScreen].bounds.size.width-20,25)];
		priceL.text = @"价格";
		priceL.font = [UIFont systemFontOfSize:16];
		priceL.textAlignment = NSTextAlignmentLeft;
		priceL.textColor = [UIColor whiteColor];
		[view addSubview:priceL];
		
		//1-5、合成图片
		UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, 1.0);
		CGContextRef context = UIGraphicsGetCurrentContext();
		[view.layer renderInContext:context];
		UIImage *endImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		view.layer.contents = nil;
		
		[self splicedNewImage:self.nImageView carImage:endImage];
	}
	
	[self splicedEcodeImageView];
	
}


//3、底部二维码图片
- (void)splicedEcodeImageView
{
	UIView *ecodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
	ecodeView.backgroundColor = [UIColor whiteColor];
	//1、文字
	UILabel *ecodeL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
	ecodeL.text = @"长按二维码,查看详情";
	ecodeL.textColor = [UIColor grayColor];
	ecodeL.textAlignment = NSTextAlignmentCenter;
	[ecodeView addSubview:ecodeL];
	
	//2、二维码
	UIImageView *ecodeImg = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2, CGRectGetMaxY(ecodeL.frame) + 20, 100, 100)];
	ecodeImg.image = [UIImage imageNamed:@""];
	ecodeImg.backgroundColor = [UIColor redColor];
	[ecodeView addSubview:ecodeImg];
	
	//3、个人信息
	UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 60) / 2, CGRectGetMaxY(ecodeImg.frame) + 20, [UIScreen mainScreen].bounds.size.width, 60)];
	iconImg.image = [UIImage imageNamed:@""];
	[ecodeView addSubview:iconImg];
	
	UILabel *iconLableN =  [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconImg.frame), [UIScreen mainScreen].bounds.size.width, 30)];
	iconLableN.text = @"名字";
	iconLableN.textColor = [UIColor grayColor];
	iconLableN.textAlignment = NSTextAlignmentCenter;
	[ecodeView addSubview:iconLableN];
	
	UILabel *iconLableP =  [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconLableN.frame), [UIScreen mainScreen].bounds.size.width, 30)];
	iconLableP.text = @"电话";
	iconLableP.textColor = [UIColor grayColor];
	iconLableP.textAlignment = NSTextAlignmentCenter;
	[ecodeView addSubview:iconLableP];
	
	//4、合成图片
	UIGraphicsBeginImageContextWithOptions(ecodeView.frame.size, YES, 1.0);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[ecodeView.layer renderInContext:context];
	UIImage *endImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	ecodeView.layer.contents = nil;
	
	[self splicedNewImage:self.nImageView carImage:endImage];
	
	
	
}

//4、车辆信息图片合成
- (UIImage *)splicedNewImage:(UIImage *)headImageV carImage:(UIImage *)carImage
{
	
	CGFloat headImgW = _spliceImgW;
	CGFloat headImgH = _spliceImgH;
	
	//carImg
	CGFloat carImgW = carImage.size.width;
	CGFloat carImgH = carImage.size.height;
	//绘制视图
	UIGraphicsBeginImageContext(CGSizeMake(headImgW, headImgH+carImgH));
	
	[headImageV drawInRect:CGRectMake(0, 0, headImgW, headImgH)];
	[carImage drawInRect:CGRectMake(0, headImgH, carImgW, carImgH)];
	
	//    [headImageV drawAtPoint:CGPointMake(0,0)];
	UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	self.nImageView = resultImg;
	_spliceImgW = resultImg.size.width;
	_spliceImgH = resultImg.size.height;
	return resultImg;
}




@end
