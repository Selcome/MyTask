//
//  DataManager.m
//  MyTask
//
//  Created by Marshal Wu on 12-2-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+(id)shareInstance{
    static DataManager *manager=nil;
    
    if(manager==nil){
        manager=[[DataManager alloc] init];
    }
    
    return manager;
}

-(NSArray *)getAllActivities{
    NSMutableArray *allActivities=[NSMutableArray array];
    
    //2012-2-5
    NSMutableArray *activites=[NSMutableArray array];
    NSMutableDictionary *activitiesForDay=[[NSMutableDictionary alloc] initWithObjectsAndKeys:activites ,@"2012-2-5", nil];
    [allActivities addObject:activitiesForDay];
    
    NSMutableDictionary *activity=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"逗小孩欢笑发电",@"title", nil];
    [activites addObject:activity];
    activity=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"送阿布回家",@"title", nil];
    [activites addObject:activity];
    activity=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"和大眼怪一起找到阿布回家的门",@"title", nil];
    [activites addObject:activity];
    
    //2012-2-4
    activites=[NSMutableArray array];
    activitiesForDay=[[NSMutableDictionary alloc] initWithObjectsAndKeys:activites ,@"2012-2-4", nil];
    [allActivities addObject:activitiesForDay];
    
    activity=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"给同事演示如何吓小孩尖叫",@"title", nil];
    [activites addObject:activity];
    activity=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"吓唬小孩尖叫发电",@"title", nil];
    [activites addObject:activity];
    
    return allActivities;
}

@end
