//
//  AsyncImageView.m
//  Lifeweeker
//
//  Created by wangjun on 10-11-30.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "AsyncImageView.h"
#import "HttpRequest.h"
@implementation AsyncImageView
@synthesize delegate,tag;
- (void)loadImageFromURL:(NSURL*)url {
    if(url!=nil&&![url isEqual:@""]) {
        if ([self isExistsFile:[url description]]) {
            //返回数据 
            if ([delegate respondsToSelector:@selector(getImageSuccess:tag:)]) {
                [delegate performSelector:@selector(getImageSuccess:tag:) withObject:[self getImage:[url description]] withObject:[NSNumber numberWithInt:self.tag]];
            }
        }else{
            HttpRequest *httpRequest=[[HttpRequest alloc] init];
            NSData *imageData=[httpRequest getGETRequest:[url absoluteString]];
            if (imageData) {
                [self writeDataToFile:[urls description] fileData:imageData];
                UIImage *image=[UIImage imageWithData:imageData];
                if ([delegate respondsToSelector:@selector(getImageSuccess:tag:)]) {
                    [delegate performSelector:@selector(getImageSuccess:tag:) withObject:image withObject:[NSNumber numberWithInt:self.tag]];
                }    
            }else{
                if ([delegate respondsToSelector:@selector(getImageFail:tag:)]) {
                    [delegate performSelector:@selector(getImageFail:tag:) withObject:nil withObject:[NSNumber numberWithInt:self.tag]];
                }   
            }
        }
    }
}
-(BOOL)isExistsFile:(NSString *)filepath
{
    NSFileManager *filemanage = [NSFileManager defaultManager];
    NSArray *array=[filepath componentsSeparatedByString:@"/"];
    return [filemanage fileExistsAtPath:[self getCacheFilePath:[array lastObject]]];
}
-(UIImage *)getImage:(NSString*)filename
{
    NSArray *array=[filename componentsSeparatedByString:@"/"];
    UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfFile:[self getCacheFilePath:[array lastObject]]]];
    return image;
}
-(NSString *) getCacheFilePath:(NSString *)filename
{
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
	NSString *path=[paths objectAtIndex:0];
	NSString *filePath=[path stringByAppendingPathComponent:filename];
    
	return filePath;
}
-(void)writeDataToFile:(NSString*)filename fileData:(NSData *)fileData
{
    NSArray *array=[filename componentsSeparatedByString:@"/"];
    [fileData writeToFile:[self getCacheFilePath:[array lastObject]] atomically:NO];
}
@end