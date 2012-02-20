//
//  AsyncImageView.m
//  Lifeweeker
//
//  Created by wangjun on 10-11-30.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "AsyncImageView.h"
@implementation AsyncImageView
@synthesize tag,delegate;
- (void)loadImageFromURL:(NSURL*)url {
    if(url!=nil&&![url isEqual:@""]) {
        if ([self isExistsFile:[url relativePath]]) {
            UIImage *image=[self getImage:[url relativePath]];
            if (image!=nil) {
                if ([delegate respondsToSelector:@selector(getImageSuccess:tag:)]) {
                    [delegate getImageSuccess:image tag:[NSNumber numberWithInt:tag]];
                }
            }
        }else{
            urls=url;
            NSURLRequest* request = [NSURLRequest requestWithURL:url];
            connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
        }
    }
}
//the URL connection calls this repeatedly as data arrives
- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
	if (data==nil) { data = [[NSMutableData alloc] initWithCapacity:2048]; } 
	[data appendData:incrementalData];
}
//the URL connection calls this once all the data has downloaded
- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
    if ([UIImage imageWithData:data]!=nil) {
        UIImage *image=[UIImage imageWithData:data];
        if ([delegate respondsToSelector:@selector(getImageSuccess:tag:)]) {
            [delegate getImageSuccess:image tag:[NSNumber numberWithInt:tag]];
        }
        [self writeDataToFile:[urls relativePath] fileData:data];
    }
	data=nil;
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