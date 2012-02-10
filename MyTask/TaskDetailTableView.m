//
//  TaskDetailTableView.m
//  MyTask
//
//  Created by Marshal Wu on 12-2-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskDetailTableView.h"
#import "TaskDetailTableViewCell.h"
@implementation TaskDetailTableView

@synthesize activity;

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
    return 1;//必然是1
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;//这里手工写，需要几个显示的数据项写几。
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *taskCellTitleId = @"taskTitleCell";
    static NSString *taskCellItemId = @"taskItemCell";
    if([indexPath row]==0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:taskCellTitleId];
        if(cell==nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:taskCellTitleId];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.textLabel.text=[activity objectForKey:@"title"];
         return cell;
    }else{
      TaskDetailTableViewCell *cell = (TaskDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:taskCellItemId];
        if(cell==nil){
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TaskDetailTableViewCell" owner:self options:nil];
            cell = [array objectAtIndex:0];
        }
        [cell onShowCell:activity indexPath:indexPath];
        return cell;
    }
    
    return nil;
}


@end
