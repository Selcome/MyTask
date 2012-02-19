//
//  DataManager.h
//  MyTask
//
//  Created by Marshal Wu on 12-2-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define jsonUrl @"http://marcuswang.github.com/MyTaskServer/activity.json"
@interface DataManager : NSObject

+(id)shareInstance;

-(NSDictionary *)getActivity:(NSString *)id;

-(NSDictionary *)getAllActivities;

-(void)deleteActivity:(id)activity;

-(BOOL)checkName:(NSString *)userName password:(NSString *)password;
@end
