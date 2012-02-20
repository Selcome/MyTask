//
//  ColleagueTableViewCell.m
//  MyTask
//
//  Created by marcus wang on 12-2-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ColleagueTableViewCell.h"

@implementation ColleagueTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)onShowCell:(NSDictionary *)dir
{
    currectDic=dir;
    [nameLable setText:[dir objectForKey:@"name"]];
    [timeLable setText:[dir objectForKey:@"phone"]];
    
    AsyncImageView *asyncImageView=[[AsyncImageView alloc] init];
    asyncImageView.tag=[[dir objectForKey:@"id"] intValue];
    asyncImageView.delegate=self;
    [asyncImageView loadImageFromURL:[NSURL URLWithString:[dir objectForKey:@"image"]]];
   
}

-(void)getImageSuccess:(UIImage *)image tag:(NSNumber *)tag
{
    if ([tag intValue]==[[currectDic objectForKey:@"id"] intValue]) {
       [iconImageView setImage:image]; 
    }
}
-(void)getImageFail:(UIImage *)image tag:(NSNumber *)tag
{

}
@end
