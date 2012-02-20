//
//  ColleagueTableViewCell.h
//  MyTask
//
//  Created by marcus wang on 12-2-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColleagueTableViewCell : UITableViewCell
{
    __weak IBOutlet UILabel *nameLable;
    __weak IBOutlet UILabel *timeLable;
    __weak IBOutlet UIImageView *iconImageView;
    NSDictionary *currentDic;
}
-(void)onShowCell:(NSDictionary *)dir;
@end
