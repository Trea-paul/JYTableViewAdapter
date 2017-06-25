//
//  HomeModel.m
//  JYTableViewAdapter
//
//  Created by TreaPaul on 2017/6/25.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

- (NSMutableArray *)articleList
{
    if (!_articleList) {
        _articleList = [NSMutableArray array];
    }
    return _articleList;
}


- (void)requestHomeData:(void(^)(HomeModel *homeModel))completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 加载本地文件，实际开发可以使用AFNetworking请求
        NSData *data = nil;
        NSString *localPath = [[NSBundle mainBundle] pathForResource:@"home.json" ofType:nil];
        data = [[NSData alloc] initWithContentsOfFile:localPath];
        
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *articleList = [responseObject valueForKey:@"artcileList"];
        
        if (articleList && articleList.count) {
            
            for (NSDictionary *article in articleList) {
                
                // 复杂时可以使用KVC赋值
                ArticleModel *model = [[ArticleModel alloc] init];
                model.title = article[@"title"];
                model.desc  = article[@"desc"];
                model.readCount    = article[@"readCount"];
                model.forwardCount = article[@"forwardCount"];
                model.Id  = article[@"Id"];
                model.url = article[@"url"];
                model.imageUrl = article[@"imageUrl"];
                
                [self.articleList addObject:model];
            }
        }
        
        completion(self);
        
    });
}

@end

@implementation ArticleModel



@end
