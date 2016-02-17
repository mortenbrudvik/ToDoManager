//
//  MyUINavigationController.h
//  TodoManager
//
//  Created by Morten Brudvik on 14/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBHandlesMOC.h"

@interface MyUINavigationController : UINavigationController <MBHandlesMOC>

- (void) receiveMOC:(NSManagedObjectContext *)incomingMoc;

@end
