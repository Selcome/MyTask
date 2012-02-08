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

-(NSArray *)getAllActivities;

-(NSDictionary *)getActivity:(NSString *)id;

@end
