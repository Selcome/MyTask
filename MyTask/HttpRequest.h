//
//  HttpRequest.h
//  MyTask
//
//  Created by marcus wang on 12-2-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject
{
    NSMutableData *requestData;
    BOOL endRequest;
}
-(NSData *)getGETRequest:(NSString *)url;

@end
