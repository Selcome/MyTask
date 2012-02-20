//
//  DataManager.m
//  MyTask
//
//  Created by Marshal Wu on 12-2-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"
#import "HttpRequest.h"
#define jsonUrl @"http://marcuswang.github.com/MyTaskServer/activity.json"
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
        HttpRequest *httpRequest=[[HttpRequest alloc] init];
        NSError *error;
        [activities addObjectsFromArray:[NSJSONSerialization JSONObjectWithData:[httpRequest getGETRequest:jsonUrl] options:kNilOptions error:&error]];
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
    if ([userName isEqual:@"Sullivan"]&&[password isEqual:@"password"]) {
        [self saveName:userName password:password];
    }else{
        [self emptyUserinfo];
    }
    return [userName isEqual:@"Sullivan"]&&[password isEqual:@"password"];
}
-(void)saveName:(NSString *)userName password:(NSString *)password
{
    NSDictionary *userinfo=[NSDictionary dictionaryWithObjectsAndKeys:userName,@"userName",password,@"password", nil];
    [[NSUserDefaults standardUserDefaults] setObject:userinfo forKey:@"userInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)emptyUserinfo
{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSDictionary *)getUserInfo
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
}
@end
