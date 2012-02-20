//
//  DataManager.m
//  MyTask
//
//  Created by Marshal Wu on 12-2-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"
#import "/usr/include/sqlite3.h"
#import "HttpRequest.h"
@implementation DataManager{
    NSMutableArray *activities;
}
+(id)shareInstance{
    static DataManager *manager=nil;
    if(manager==nil){
        manager=[[DataManager alloc] init];
    }
    return manager;
}
- (id)init {
    self = [super init];
    if (self) {
        activities=[NSMutableArray array];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"吓唬小孩尖叫发电",@"title",@"吓唬小孩尖叫发电",@"content",@"1",@"id",@"task",@"type",@"苏利文",@"author",@"2012-2-5",@"createTime",@"未完成",@"status",@"王军",@"cc",@"",@"tags",@"Marshal",@"addUser",nil]];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"演示如何吓小孩尖叫",@"title",@"给同事演示如何吓小孩尖叫",@"content",@"2",@"id",@"task",@"type",@"苏利文",@"author",@"2012-2-5",@"createTime",@"未完成",@"status",@"王军",@"cc",@"",@"tags",@"Marshal",@"addUser",nil]];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"找到阿布回家的门",@"title",@"和大眼怪一起找到阿布回家的门",@"content",@"3",@"id",@"task",@"type",@"大眼怪迈克",@"author",@"2012-2-4",@"createTime",@"未完成",@"status",@"王军",@"cc",@"",@"tags",@"Marshal",@"addUser",nil]];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"送阿布回家",@"title",@"送阿布回家",@"content",@"4",@"id",@"task",@"type",@"大眼怪迈克",@"author",@"2012-2-4",@"createTime",@"未完成",@"status",@"王军",@"cc",@"",@"tags",@"Marshal",@"addUser",nil]];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"逗小孩欢笑发电",@"title",@"逗小孩欢笑发电",@"content",@"5",@"id",@"task",@"type",@"大眼怪迈克",@"author",@"2012-2-4",@"createTime",@"未完成",@"status",@"王军",@"cc",@"",@"tags",@"Marshal",@"addUser",nil]];
    }
    return self;
}

-(NSDictionary *)getActivity:(NSString *)id{
    for(NSDictionary * d in activities){
        if([[d objectForKey:@"id"] isEqual:id]){
            return d;
        }
    }
    return nil;
}
-(NSDictionary *)getAllActivities
{
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
     for (int i=0;i<[activities count];i++) {
         NSDictionary *activitiesDir=[activities objectAtIndex:i];
         NSString *crateTime=[activitiesDir objectForKey:@"createTime"];
         NSMutableArray *array=[dic objectForKey:crateTime];
         if (!array) {
             array=[NSMutableArray array];
         }
         [array addObject:activitiesDir];
         [dic setObject:array forKey:crateTime];
     }
    return dic;
}
-(void)deleteActivity:(id)activity
{
    [activities removeObject:activity];
}
-(BOOL)checkName:(NSString *)userName password:(NSString *)password
{
    return [userName isEqual:@"Sullivan"]&&[password isEqual:@"password"];
}
@end
