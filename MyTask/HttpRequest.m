//
//  HttpRequest.m
//  MyTask
//
//  Created by marcus wang on 12-2-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HttpRequest.h"

@interface HttpRequest()

-(void)startGetHttpData:(NSString *)url;

@end

@implementation HttpRequest

-(NSData *)getGETRequest:(NSString *)url
{
    [self startGetHttpData:url]; 
    while (!endRequest) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    return requestData;
}
-(void)startGetHttpData:(NSString *)url{
    requestData=nil;
    endRequest=NO;
    //http 数据下载 开始
    //将post数据转换为 NSASCIIStringEncoding 编码格式
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];  
    [request setURL:[NSURL URLWithString:url]];
    //创建链接
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn)    
    {   
        
    } 
    //http 数据下载结束
}
#pragma mark -
#pragma mark Http post 数据
// 每收到一次数据, 会调用一次
- (void)connection:(NSURLConnection *)aConn didReceiveData:(NSData *)data
{
    if (requestData) {
        [requestData appendData:data];
    }else{
        requestData=(NSMutableData *)data;
    }
}
// 网络错误时触发
- (void)connection:(NSURLConnection *)aConn didFailWithError:(NSError *)error
{
    [self performSelectorOnMainThread:@selector(setEnd) withObject:nil waitUntilDone:NO];
}
// 全部数据接收完毕时触发
- (void)connectionDidFinishLoading:(NSURLConnection *)aConn
{
    [self performSelectorOnMainThread:@selector(setEnd) withObject:nil waitUntilDone:NO];
}
-(void)setEnd{
    endRequest=YES;
}
@end
