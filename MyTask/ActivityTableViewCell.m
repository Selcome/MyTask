//
//  ActivityTableViewCell.m
//  MyTask
//
//  Created by marcus wang on 12-2-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

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

-(void)onShowCell:(NSDictionary *)activity
{
    contentLable.text=[activity objectForKey:@"title"];
    iconImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@_small.png",[activity objectForKey:@"type"]]];
    authorLable.text=[NSString stringWithFormat:@"发布人:%@",[activity objectForKey:@"author"]];
    createTimerLable.text=[activity objectForKey:@"createTime"];
}

@end
