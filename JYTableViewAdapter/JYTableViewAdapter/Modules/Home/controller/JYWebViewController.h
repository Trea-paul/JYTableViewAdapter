//
//  JYWebViewController.h
//  JYTableViewAdapter
//
//  Created by TreaPaul on 2017/6/25.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

#import "JYBaseViewController.h"

@interface JYWebViewController : JYBaseViewController

@property (nonatomic, copy) NSString *requestUrl;
/** 是否显示Nav */
@property (nonatomic,assign) BOOL isNavHidden;

@end
