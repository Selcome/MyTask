//
//  TaskDetailTableViewCell.m
//  MyTask
//
//  Created by marcus wang on 12-2-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskDetailTableViewCell.h"

@implementation TaskDetailTableViewCell

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

-(void)onShowCell:(NSDictionary *)dir indexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row]==1) {
        nameLable.text=@"描述";
        contentLable.text=[dir objectForKey:@"content"];
    }else if ([indexPath row]==2) {
        nameLable.text=@"状态";
        contentLable.text=[dir objectForKey:@"status"];
    }else if ([indexPath row]==3) {
        nameLable.text=@"执行者";
        contentLable.text=[dir objectForKey:@"cc"];
    }else if ([indexPath row]==4) {
        nameLable.text=@"添加人";
        contentLable.text=[dir objectForKey:@"addUser"];
    }else if ([indexPath row]==5) {
        nameLable.text=@"标签";
        contentLable.text=[dir objectForKey:@"tags"];
    }
}

@end
