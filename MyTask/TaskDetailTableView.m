//
//  TaskDetailTableView.m
//  MyTask
//
//  Created by Marshal Wu on 12-2-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskDetailTableView.h"

@implementation TaskDetailTableView{
    NSArray *taskDetails;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.dataSource=self;
        self.delegate=self;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return [taskDetails count];
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *sectionName=nil;
    switch (section) {
        case 0:
            sectionName=@"今天";
            break;
        case 1:
            sectionName=@"昨天";
            break;
        default:
            break;
    }
    return sectionName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *taskCellTitleId = @"taskTitleCell";
    static NSString *taskCellItemId = @"taskItemCell";
    
    UITableViewCell *cell =nil;
    
    if([indexPath row]==0){
         cell = [tableView dequeueReusableCellWithIdentifier:taskCellTitleId];
        if(cell==nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:taskCellTitleId];
        }
        cell.textLabel.text=@"逗小朋友尖叫发电";
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:taskCellItemId];
        if(cell==nil){
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TaskDetailTableViewCell" owner:self options:nil];
            cell = [array objectAtIndex:0];
        }
    }
    
    return cell;
}


@end
