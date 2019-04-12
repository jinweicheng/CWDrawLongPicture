//
//  CWSpecialHeaderView.h
//  CarWins
//
//  Created by mac on 2018/10/23.
//  Copyright © 2018年 CarWins Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**< 设置协议方法 */
@protocol CWSpecialHeaderViewDelegate <NSObject>

@required
@end

@interface CWSpecialHeaderView : UICollectionReusableView
/**< 背景图 */
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
/**< 集团名 */
@property (weak, nonatomic) IBOutlet UILabel *groupNameL;
/**< 进店逛逛 */
@property (weak, nonatomic) IBOutlet UILabel *enterShopL;
/**< 集团地址 */
@property (weak, nonatomic) IBOutlet UILabel *groupAddressL;
/**< 电话 */
@property (weak, nonatomic) IBOutlet UILabel *telephoneL;
/**< 打电话 */
@property (weak, nonatomic) IBOutlet UIImageView *telephotoImg;
/**< 推荐车辆 */
@property (weak, nonatomic) IBOutlet UILabel *recommendCarL;
/**< 切换cell--btn */
@property (weak, nonatomic) IBOutlet UIButton *switchStyleBtn;

@end
