//
//  HomeModel.h
//  JYTableViewAdapter
//
//  Created by TreaPaul on 2017/6/25.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

#import "JYBaseModel.h"

@class ArticleModel;

@interface HomeModel : JYBaseModel



@property (nonatomic, strong) NSMutableArray <ArticleModel *> *articleList;

/**
 请求首页数据
 */
- (void)requestHomeData:(void(^)(HomeModel *homeModel))completion;



@end

@interface ArticleModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *readCount;
@property (nonatomic, copy) NSString *forwardCount;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *imageUrl;

@end
