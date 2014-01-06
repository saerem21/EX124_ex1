//
//  ViewController.m
//  EX124_ex1
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(1 == alertView.tag){
        if(alertView.cancelButtonIndex == buttonIndex){
            NSLog(@"취소");
        }
        
        else if(alertView.firstOtherButtonIndex == buttonIndex) {
            NSLog(@"선택1");
        }
        
        else if((alertView.firstOtherButtonIndex + 1) == buttonIndex) {
            NSLog(@"선택2");
        }
        
    }
    else if(2 == alertView.tag) {
        if(alertView.firstOtherButtonIndex == buttonIndex){
            UITextField *idText = [alertView textFieldAtIndex:0];
            UITextField *pwText = [alertView textFieldAtIndex:1];
            
            NSLog(@"id: %@ p: %@",idText.text,pwText.text);
            
        }
        else {
            NSLog(@"login fall");
        }
    }
    else{
        NSLog(@"err");
    }
}

-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView{
    if (2 == alertView.tag) {
        UITextField *idText = [alertView textFieldAtIndex:0];
        UITextField *pwText = [alertView textFieldAtIndex:1];
        return ([idText.text length] >3 && [pwText.text length] >3);
    }
    return YES;
}
- (IBAction)loginAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login" message:@"id and pw input" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alert.tag = 2;
    [alert show];
}

- (IBAction)basicAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"aa", nil];
    alert.tag = 1;
    [alert show];

    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
