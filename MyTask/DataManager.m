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
        /*
        //使用数据库生成的fake数据
        sqlite3 *database;
        NSString *databaseFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"mytask.sqlite"];
        
        if (sqlite3_open([databaseFilePath UTF8String], &database)==SQLITE_OK) { 
            //            NSLog(@">>>>open sqlite db ok.");
            
            const char *selectSql="select id,title,content from task"; 
            sqlite3_stmt *statement; 
            if (sqlite3_prepare_v2(database, selectSql, -1, &statement, nil)==SQLITE_OK) { 
                //                NSLog(@">>>>>>select ok."); 
                while (sqlite3_step(statement)==SQLITE_ROW) {
                    int _id=sqlite3_column_int(statement, 0);
                    NSNumber *theId=[NSNumber numberWithInt:_id];
                    NSString *title=[[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
                    NSString *content=[[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
                    NSLog(@"id: %@,title: %@, content: %@",[theId stringValue],title,content);
                    
                    [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:title,@"title",content,@"content",theId,@"id", nil]];
                }
            }
            
            sqlite3_finalize(statement);
        }
        
        sqlite3_close(database); 
        */
        
        /* 这里是直接创建的fake数据
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"吓唬小孩尖叫发电",@"title",@"吓唬小孩尖叫发电",@"content",@"1",@"id", nil]];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"演示如何吓小孩尖叫",@"title",@"给同事演示如何吓小孩尖叫",@"content",@"2",@"id", nil]];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"找到阿布回家的门",@"title",@"和大眼怪一起找到阿布回家的门",@"content",@"3",@"id", nil]];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"送阿布回家",@"title",@"送阿布回家",@"content",@"4",@"id", nil]];
         [activities addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"逗小孩欢笑发电",@"title",@"逗小孩欢笑发电",@"content",@"5",@"id", nil]];
         */
        
         //使用http生成的fake数据
//        /*
        HttpRequest *httpRequest=[[HttpRequest alloc] init];
        NSError *error;
       activities=[NSJSONSerialization JSONObjectWithData:[httpRequest getGETRequest:jsonUrl] options:kNilOptions error:&error];
//         */
        /*
        //使用plist 
        NSString *filename= [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"mytask.plist"]; 
        //读文件
        activities= [[NSDictionary dictionaryWithContentsOfFile:filename] objectForKey:@"mytask"];
         */
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

-(NSArray *)getAllActivities{
    NSMutableArray *allActivities=[NSMutableArray array];
    
    //2012-2-5
    NSMutableArray *activitiesArray=[NSMutableArray array];
    NSMutableDictionary *activitiesDirectory=[[NSMutableDictionary alloc] initWithObjectsAndKeys:activitiesArray ,@"2012-2-5", nil];
    [allActivities addObject:activitiesDirectory];
    
    [activitiesArray addObject:[activities objectAtIndex:4]];
    [activitiesArray addObject:[activities objectAtIndex:3]];
    
    //2012-2-4
    activitiesArray=[NSMutableArray array];
    activitiesDirectory=[[NSMutableDictionary alloc] initWithObjectsAndKeys:activitiesArray ,@"2012-2-4", nil];
    [allActivities addObject:activitiesDirectory];
    
    [activitiesArray addObject:[activities objectAtIndex:2]];
    [activitiesArray addObject:[activities objectAtIndex:1]];
    [activitiesArray addObject:[activities objectAtIndex:0]];
    
    return allActivities;
}

@end
