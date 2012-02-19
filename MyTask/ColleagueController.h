//
//  ColleagueController.h
//  MyTask
//
//  Created by marcus wang on 12-2-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColleagueController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *rootTableView;
    NSArray *colleagueArray;
}
@end