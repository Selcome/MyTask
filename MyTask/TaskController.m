//
//  TaskController.m
//  MyTask
//
//  Created by Marshal Wu on 12-2-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskController.h"
#import "TaskDetailTableView.h"

@implementation TaskController{
    __weak UIView *currentSubView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *) theTitle
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=theTitle;
    }
    return self;
}

- (IBAction)switchSubView:(id)sender {
//    UISegmentedControl *segment=(UISegmentedControl *)sender;
//    switch ([segment selectedSegmentIndex]) {
//        case 0:
//            if(currentSubView!=detailView){
//                [currentSubView removeFromSuperview];
//                currentSubView=detailView;
//                [subViewsContainer addSubview:detailView];
//            }
//            break;
//        case 1:
//            if(currentSubView!=commentView){
//                [currentSubView removeFromSuperview];
//                currentSubView=commentView;
//                [subViewsContainer addSubview:commentView];
//            }
//            break;
//        case 2:
//            if(currentSubView!=childTasksView){
//                [currentSubView removeFromSuperview];
//                currentSubView=childTasksView;
//                [subViewsContainer addSubview:childTasksView];
//            }
//            break;
//        default:
//            break;
//    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    currentSubView=taskDetailView;
    [subViewContainer addSubview:taskDetailView];
}

- (void)viewDidUnload
{
    subViewContainer = nil;
    taskDetailView = nil;
    taskDetailViewCell = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
