//
//  MBHandlesToDoEntity.h
//  TodoManager
//
//  Created by Morten Brudvik on 14/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoEntity.h"

@protocol MBHandlesToDoEntity <NSObject>

- (void) receiveToDoEntity:(ToDoEntity * ) incomingToDoEntity;


@end
