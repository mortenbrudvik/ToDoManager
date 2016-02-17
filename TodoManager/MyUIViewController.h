//
//  MyUIViewController.h
//  TodoManager
//
//  Created by Morten Brudvik on 14/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBHandlesMOC.h"
#import "MBHandlesToDoEntity.h"


@interface MyUIViewController : UIViewController <MBHandlesMOC, MBHandlesToDoEntity>

- (void) receiveMOC:(NSManagedObjectContext *)incomingMoc;
- (void) receiveToDoEntity:(ToDoEntity * ) incomingToDoEntity;


@end
