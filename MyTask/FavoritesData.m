//
//  FavoritesData.m
//  MyTask
//  数据层 
//  Created by marcus wang on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FavoritesData.h"

@interface FavoritesData()
-(void)createEnvironment;
-(NSString *)getFilePath;
@end

@implementation FavoritesData
{
    NSMutableArray *favoritesArray;
}
- (id)init {
    self = [super init];
    if (self) {
        [self createEnvironment];
    }
    return self;
}
-(void)createEnvironment
{
    favoritesArray=[NSMutableArray array];
    favoritesArray = [NSKeyedUnarchiver unarchiveObjectWithFile: [self getFilePath]]; 
    if (!favoritesArray) {
        NSMutableArray *arrayDir=[NSMutableArray array];
        [arrayDir addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"苏利文",@"name",@"s",@"firstName",@"男",@"sex",nil]];
        [arrayDir addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"苏利文1",@"name",@"s",@"firstName",@"男",@"sex",nil]];
        [arrayDir addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"大眼怪迈克",@"name",@"d",@"firstName",@"男",@"sex",nil]];
        [NSKeyedArchiver archiveRootObject:arrayDir toFile:[self getFilePath]];
        favoritesArray=arrayDir;
    }
}
-(NSString *)getFilePath
{
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];    
    return  [Path stringByAppendingPathComponent:@"favoritesData.plist"];
}
-(NSMutableDictionary *)getFavoritesDir
{
    NSMutableDictionary *favoritesdir=[NSMutableDictionary dictionary];
    for (int i=0; i<[favoritesArray count]; i++) {
        NSDictionary *dir=[favoritesArray objectAtIndex:i];
        NSString *firstName=[dir objectForKey:@"firstName"];
        NSMutableArray *array=[dir objectForKey:firstName];
        if (!array) {
            array=[NSMutableArray array];
        }
        [array addObject:dir];
        [favoritesdir setValue:array forKey:firstName];
    }
    NSLog(@"数据结构=%@",favoritesdir);
    return favoritesdir;
}
-(void)deleteFavorites:(NSDictionary *)dir
{
    [favoritesArray removeObject:dir];
}
@end
