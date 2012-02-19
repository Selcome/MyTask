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
- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}
-(BOOL)checkName:(NSString *)userName password:(NSString *)password
{
    return [userName isEqual:@"Sullivan"]&&[password isEqual:@"password"];
}
@end
