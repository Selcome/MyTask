//
//  TaskController.h
//  MyTask
//
//  Created by Marshal Wu on 12-2-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskDetailTableView;

@interface TaskController : UIViewController{
    __weak IBOutlet UIView *subViewContainer;
    IBOutlet TaskDetailTableView *taskDetailView;
    IBOutlet UITableView *commentView;
    IBOutlet UITableView *childTaskView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil id:(NSString *) theId;

- (IBAction)switchSubView:(id)sender;

@end
