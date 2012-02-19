//
//  ColleagueController.h
//  MyTask
//
//  Created by marcus wang on 12-2-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

<<<<<<< HEAD
@interface ColleagueController : UIViewController

=======
@interface ColleagueController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *rootTableView;
    NSArray *colleagueArray;
}
>>>>>>> wangjun_MyTask
@end