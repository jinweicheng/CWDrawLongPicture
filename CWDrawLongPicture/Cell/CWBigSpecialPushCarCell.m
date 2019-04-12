//
//  CWBigSpecialPushCarCell.m
//  CarWins
//
//  Created by mac on 2018/10/24.
//  Copyright © 2018年 CarWins Inc. All rights reserved.
//

#import "CWBigSpecialPushCarCell.h"

@implementation CWBigSpecialPushCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:@"21.8万" attributes:attribtDic];
    self.oPriceL.attributedText = attribtStr;
}

@end
