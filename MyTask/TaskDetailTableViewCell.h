//
//  TaskDetailTableViewCell.h
//  MyTask
//
//  Created by marcus wang on 12-2-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskDetailTableViewCell : UITableViewCell
{
    __weak IBOutlet UILabel *nameLable;
    __weak IBOutlet UILabel *contentLable;
}

-(void)onShowCell:(NSDictionary *)dir indexPath:(NSIndexPath *)indexPath;

@end
