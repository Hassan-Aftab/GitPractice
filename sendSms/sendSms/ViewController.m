//
//  ViewController.m
//  sendSms
//
//  Created by Coeus on 26/02/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextView *messageBox;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sendButtonPressed:(id)sender {
    NSString * number = self.phoneNumber.text;
    NSString * message = self.messageBox.text;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
