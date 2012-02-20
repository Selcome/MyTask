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
    [nameLable setText:[dir objectForKey:@"name"]];
    [timeLable setText:[dir objectForKey:@"phone"]];
    
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[dir objectForKey:@"image"]]];
    UIImage *img=[UIImage imageWithData:data];
    [iconImageView setImage:img];
}
@end
