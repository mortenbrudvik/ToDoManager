//
//  MyUINavigationController.m
//  TodoManager
//
//  Created by Morten Brudvik on 14/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//

#import "MyUINavigationController.h"

@interface MyUINavigationController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

@implementation MyUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) receiveMOC:(NSManagedObjectContext *)incomingMoc{
    self.managedObjectContext = incomingMoc;
    
    id<MBHandlesMOC> child = (id<MBHandlesMOC>) self.viewControllers[0];
    [child receiveMOC:self.managedObjectContext];

}

@end






