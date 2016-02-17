//
//  ToDoEntity+CoreDataProperties.h
//  TodoManager
//
//  Created by Morten Brudvik on 16/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *toDoTitle;
@property (nullable, nonatomic, retain) NSString *toDoDetails;
@property (nullable, nonatomic, retain) NSDate *toDoDate;
@property (nullable, nonatomic, retain) NSString *toDoPriority;
@property (nullable, nonatomic, retain) NSString *toDoContext;

@end

NS_ASSUME_NONNULL_END
