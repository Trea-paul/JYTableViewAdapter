//
//  JYTableViewCellModel.h
//  CYSDemo
//
//  Created by Paul on 2017/5/5.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

@interface JYTableViewCellModel : NSObject


/**
 通用属性
 */
@property (nonatomic, strong) Class cellClass;

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *displayValue;

@property (nonatomic, strong) id model;

@property (nonatomic, copy) NSString *linkUrl;  

// the height of the row
@property (nonatomic, assign) CGFloat rowHeight;

// 分割线位置
@property (nonatomic, assign) UIEdgeInsets separatorInset;



@end

@interface JYTableViewListCellModel : JYTableViewCellModel

/**
 列表属性
 */

// Label
@property (nonatomic, copy) NSString *topLeftLbTitle;
@property (nonatomic, copy) NSString *topCenterLbTitle;
@property (nonatomic, copy) NSString *topRightLbTitle;

@property (nonatomic, copy) NSString *centerLeftLbTitle;
@property (nonatomic, copy) NSString *centerLbTitle;
@property (nonatomic, copy) NSString *centerRightLbTitle;

@property (nonatomic, copy) NSString *bottomLeftLbTitle;
@property (nonatomic, copy) NSString *bottomCenterLbTitle;
@property (nonatomic, copy) NSString *bottomRightLbTitle;

// button
@property (nonatomic, copy) NSString *topLeftBtnTitle;
@property (nonatomic, copy) NSString *topCenterBtnTitle;
@property (nonatomic, copy) NSString *topRightBtnTitle;

@property (nonatomic, copy) NSString *centerLeftBtnTitle;
@property (nonatomic, copy) NSString *centerBtnTitle;
@property (nonatomic, copy) NSString *centerRightBtnTitle;

@property (nonatomic, copy) NSString *bottomLeftBtnTitle;
@property (nonatomic, copy) NSString *bottomCenterBtnTitle;
@property (nonatomic, copy) NSString *bottomRightBtnTitle;

// ImagviewView
@property (nonatomic, copy) NSString *topLeftImageName;
@property (nonatomic, copy) NSString *topRightImageName;

@property (nonatomic, copy) NSString *centerLeftImageName;
@property (nonatomic, copy) NSString *centerRightImageName;

@property (nonatomic, copy) NSString *bottomLeftImageName;
@property (nonatomic, copy) NSString *bottomRightImageName;



@end

@interface JYTableViewAttributeListCellModel : JYTableViewListCellModel

@property (nonatomic, copy) NSAttributedString *attributeString;



@end
