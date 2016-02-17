//
//  MyUITableViewCell.m
//  TodoManager
//
//  Created by Morten Brudvik on 14/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//

#import "MyUITableViewCell.h"

@implementation MyUITableViewCell

- (void) setInternalFields: (ToDoEntity *) incomingToDoEntity{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
     
    self.todoTitleLabel.text = incomingToDoEntity.toDoTitle;
    self.todoDueDateLabel.text = [dateFormatter stringFromDate: incomingToDoEntity.toDoDate];
    self.todoContextLabel.text = incomingToDoEntity.toDoContext;
    self.todoPriorityLabel.text = incomingToDoEntity.toDoPriority;
    
    self.localToDoEntity = incomingToDoEntity;
}


@end
