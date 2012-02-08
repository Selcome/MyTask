//
//  ActivityTableViewCell.h
//  MyTask
//
//  Created by marcus wang on 12-2-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableViewCell : UITableViewCell
{

    __weak IBOutlet UIImageView *iconImageView;
    __weak IBOutlet UILabel *contentLable;
    __weak IBOutlet UILabel *authorLable;
    __weak IBOutlet UILabel *createTimerLable;
    
}

-(void)onShowCell:(NSDictionary *)activity;

@end
