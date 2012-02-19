//
//  DataManager.h
//  MyTask
//
//  Created by Marshal Wu on 12-2-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DataManager : NSObject

+(id)shareInstance;
-(BOOL)checkName:(NSString *)userName password:(NSString *)password;
@end
