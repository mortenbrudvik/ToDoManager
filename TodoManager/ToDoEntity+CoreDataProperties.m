//
//  ToDoEntity+CoreDataProperties.m
//  TodoManager
//
//  Created by Morten Brudvik on 16/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoEntity+CoreDataProperties.h"

@implementation ToDoEntity (CoreDataProperties)

@dynamic toDoTitle;
@dynamic toDoDetails;
@dynamic toDoDate;
@dynamic toDoPriority;
@dynamic toDoContext;

@end
