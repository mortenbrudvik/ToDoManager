//
//  MyUITableViewCell.h
//  TodoManager
//
//  Created by Morten Brudvik on 14/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity.h"

@interface MyUITableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoDueDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoContextLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoPriorityLabel;

@property (strong, nonatomic) ToDoEntity *localToDoEntity;

- (void) setInternalFields: (ToDoEntity *) incomingToDoEntity;

@end
