//
//  AsyncImageView.h
//  Lifeweeker
//
//  Created by wangjun on 10-11-30.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AsyncImageDelegate <NSObject>

-(void)getImageSuccess:(UIImage *)image tag:(NSNumber *)tag;
-(void)getImageFail:(UIImage *)image tag:(NSNumber *)tag;

@end

@interface AsyncImageView : UIView {
	NSURLConnection* connection; 
	NSMutableData* data; 
    NSURL *urls;
    NSObject<AsyncImageDelegate> *delegate;
}
@property (nonatomic,assign) int tag;
@property (nonatomic,strong) NSObject<AsyncImageDelegate> *delegate;
- (void)loadImageFromURL:(NSURL*)url;

-(BOOL)isExistsFile:(NSString *)filepath;
-(UIImage *)getImage:(NSString*)filename;
-(void)writeDataToFile:(NSString*)filename fileData:(NSData *)fileData;
-(NSString *) getCacheFilePath:(NSString *)filename;

@end
