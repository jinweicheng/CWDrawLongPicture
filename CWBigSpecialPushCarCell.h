//
//  CWBigSpecialPushCarCell.h
//  CarWins
//
//  Created by mac on 2018/10/24.
//  Copyright © 2018年 CarWins Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWBigSpecialPushCarCell : UICollectionViewCell
/**< 背景大图 */
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
/**< 车型 */
@property (weak, nonatomic) IBOutlet UILabel *modelNameL;
/**< 车辆其他信息 */
@property (weak, nonatomic) IBOutlet UILabel *carInfoL;
/**< 新价格 */
@property (weak, nonatomic) IBOutlet UILabel *nPriceL;
/**< 前销售价格 */
@property (weak, nonatomic) IBOutlet UILabel *oPriceL;


@end
