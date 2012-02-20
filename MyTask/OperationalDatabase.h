//
//  OperationalDatabase.h
//  QatAudio
//
//  Created by wangjun on 11-9-5.
//  Copyright 2011年 www.witmob.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
/*
  主要是操作数据库
 **/

@interface OperationalDatabase : NSObject {
   
     sqlite3 *database;
}
+ (OperationalDatabase *) defaultManager;


//////////////////////////数据库的基本操作//////
-(void)openDatabase;
-(void) close;

///操作数据
-(NSArray *)getColleagueArray;

@end
