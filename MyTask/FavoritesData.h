//
//  FavoritesData.h
//  MyTask
//
//  Created by marcus wang on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesData : NSObject
-(NSMutableDictionary *)getFavoritesDir;
-(void)deleteFavorites:(NSDictionary *)dir;
@end
