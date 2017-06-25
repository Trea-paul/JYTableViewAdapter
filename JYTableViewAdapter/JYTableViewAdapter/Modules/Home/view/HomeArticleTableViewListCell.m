//
//  HomeArticleTableViewListCell.m
//  JYTableViewAdapter
//
//  Created by TreaPaul on 2017/6/25.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

#import "HomeArticleTableViewListCell.h"

@implementation HomeArticleTableViewListCell

+ (CGFloat)cellHeightForCellModel:(JYTableViewCellModel *)cellModel
{
    return 100;
}

- (void)setup
{
    self.topLeftLb.font = FONT_SIZE(16);
    self.topLeftLb.textColor = HexRGB(0x333333);
    
    self.centerLeftLb.font = FONT_SIZE(14);
    self.centerLeftLb.textColor = HexRGB(0x818181);
    self.centerLeftLb.numberOfLines = 2;
    
    self.bottomLeftLb.font = FONT_SIZE(12);
    self.bottomLeftLb.textColor = HexRGB(0xBBBBBB);
    
    self.bottomCenterLb.font = FONT_SIZE(12);
    self.bottomCenterLb.textColor = HexRGB(0xBBBBBB);
    
}


/**
 设置尺寸
 笔者采用最原始方法
 实际开发可以引入Masonry等布局框架
 */
- (void)updateCellFrame
{
    self.topLeftLb.frame = CGRectMake(12, 10, CGRectGetWidth(self.frame) - 24, 20);
    
    self.centerLeftLb.frame = CGRectMake(12, CGRectGetMaxY(self.topLeftLb.frame), CGRectGetWidth(self.frame) - 24, 40);
    
    self.bottomLeftLb.frame = CGRectMake(12, CGRectGetHeight(self.frame) - 25, 100, 12);
    
    self.bottomCenterLb.frame = CGRectMake(CGRectGetMaxX(self.bottomLeftLb.frame) + 12, CGRectGetHeight(self.frame) - 25, 100, 12);
}


// 可选计算高度
//+ (CGFloat)heightForRowWithModel:(id)model
//{
//    return 100;
//}

@end
