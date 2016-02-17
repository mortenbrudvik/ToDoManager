//
//  MyUIViewController.m
//  TodoManager
//
//  Created by Morten Brudvik on 14/02/16.
//  Copyright © 2016 Morten Brudvik. All rights reserved.
//

#import "MyUIViewController.h"

@interface MyUIViewController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) ToDoEntity *localToDoEntity;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *detailsField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDateField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityField;
@property (weak, nonatomic) IBOutlet UITextField *contextField;

@property (nonatomic, assign) BOOL wasDeleted;

@end

@implementation MyUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveMyToDoEntity{
    
    NSError *err;
    BOOL saveSuccess = [self.managedObjectContext save:&err];
    if (!saveSuccess) {
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couln´t save" userInfo:@{NSUnderlyingErrorKey:err}];
    }
}

- (void) textViewDidEndEditing:(NSNotification *) notification{
    if( [notification object] == self){
        self.localToDoEntity.toDoDetails = self.detailsField.text;
        [self saveMyToDoEntity];
    }
}


- (IBAction)trashTapped:(id)sender {
    self.wasDeleted = YES;
    [self.managedObjectContext deleteObject:self.localToDoEntity];
    [self saveMyToDoEntity];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void) viewWillAppear:(BOOL)animated{
    
    // setup delete state
    self.wasDeleted = NO;
    
    self.textField.text = self.localToDoEntity.toDoTitle;
    self.detailsField.text = self.localToDoEntity.toDoDetails;
    self.contextField.text = self.localToDoEntity.toDoContext;
    
    NSString *priorityText = self.localToDoEntity.toDoPriority;
    
    if ([priorityText isEqualToString: @"Low"])
        self.priorityField.selectedSegmentIndex = 0;
    else if ( [priorityText isEqualToString: @"Medium"])
        self.priorityField.selectedSegmentIndex = 1;
    else if ([priorityText isEqualToString: @"High"])
        self.priorityField.selectedSegmentIndex = 2;
    
    NSDate *dueDate = self.localToDoEntity.toDoDate;
    if(dueDate != nil){
        [self.dueDateField setDate:dueDate];
    }
    
    // Detect edit ends
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    
}


- (void) viewWillDisappear:(BOOL)animated{
    
    if(self.wasDeleted == NO){

        self.localToDoEntity.toDoTitle = self.textField.text;
        self.localToDoEntity.toDoDetails = self.detailsField.text;
        self.localToDoEntity.toDoDate = self.dueDateField.date;
        self.localToDoEntity.toDoContext = self.contextField.text;
        self.localToDoEntity.toDoPriority = [self.priorityField titleForSegmentAtIndex:self.priorityField.selectedSegmentIndex];

        if ( [self.textField.text length] == 0)
            self.localToDoEntity.toDoTitle = @"no title";
        
        [self saveMyToDoEntity];
    }
    
    //Remove detection
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidEndEditingNotification object:self];
}


- (IBAction)titleFieldEditted:(id)sender {
    self.localToDoEntity.toDoTitle = self.textField.text;
    [self saveMyToDoEntity];
}

- (IBAction)contextEditted:(id)sender {
    self.localToDoEntity.toDoContext = self.contextField.text;
    [self saveMyToDoEntity];
}

- (IBAction)priorityEditted:(id)sender {
    self.localToDoEntity.toDoPriority = [self.priorityField titleForSegmentAtIndex:self.priorityField.selectedSegmentIndex];
}


- (IBAction)dueDateEditted:(id)sender {
    self.localToDoEntity.toDoDate = self.dueDateField.date;
    [self saveMyToDoEntity];
}


- (void) receiveMOC:(NSManagedObjectContext *)incomingMoc{
    self.managedObjectContext = incomingMoc;
}

- (void) receiveToDoEntity:(ToDoEntity * ) incomingToDoEntity{
    self.localToDoEntity = incomingToDoEntity;
}


@end
