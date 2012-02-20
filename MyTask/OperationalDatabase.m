//
//  OperationalDatabase.m
//  QatAudio
//
//  Created by wangjun on 11-9-5.
//  Copyright 2011年 www.witmob.com. All rights reserved.
//

#import "OperationalDatabase.h"

#import "SQL.h"
@implementation OperationalDatabase

-(void)openDatabase
{
    //打开数据库
    NSString *filename= [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:kQatDatabases]; 
    if (sqlite3_open([filename UTF8String], &database)==SQLITE_OK) {
        NSLog(@"QatAlbum db opened.");
    }
}
-(void) close
{
    sqlite3_close(database);
	NSLog(@"OperationalDatabase db closed.");
}

static OperationalDatabase *defaultManager; 
+ (OperationalDatabase *) defaultManager{
	if (!defaultManager) {
		defaultManager=[[OperationalDatabase alloc] init];
	}
	return defaultManager;
}
/////////////////////////操作qat_flage操作////////
-(NSArray *)getColleagueArray
{
    NSMutableArray *array=nil;
	sqlite3_stmt *statement;
	if (sqlite3_prepare_v2(database, kSqlSelectColleague, -1, &statement, nil)==SQLITE_OK) {
		while (sqlite3_step(statement)==SQLITE_ROW) {
			if (!array) {
				array=[NSMutableArray array];
			}
			int index=0;
            NSMutableDictionary *colleagueDir=[NSMutableDictionary dictionary];
            [colleagueDir setObject:[NSNumber numberWithInt:sqlite3_column_int(statement, index++)] forKey:@"id"];
            char *phone=(char *)sqlite3_column_text(statement, index++);
            if (phone!=NULL) {
                [colleagueDir setObject:[NSString stringWithCString:phone encoding:NSUTF8StringEncoding] forKey:@"phone"];
            }
            char *image=(char *)sqlite3_column_text(statement, index++);
            if (phone!=NULL) {
                [colleagueDir setObject:[NSString stringWithCString:image encoding:NSUTF8StringEncoding] forKey:@"image"];
            }
            char *name=(char *)sqlite3_column_text(statement, index++);
            if (name!=NULL) {
                [colleagueDir setObject:[NSString stringWithCString:name encoding:NSUTF8StringEncoding] forKey:@"name"];
            }
            [array addObject:colleagueDir];
		}
	}
	sqlite3_finalize(statement);
	return array;

}
@end
