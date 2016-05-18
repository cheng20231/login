//
//  ViewController.m
//  LoginUser
//
//  Created by 黃彥程 on 2016/2/2.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *viewText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.viewText.text = nil;
    self.userArray=[[NSMutableArray alloc]initWithObjects:@"pay123",@"curry1234",nil];
//    self.passwordArray =[[NSMutableArray alloc]initWithObjects:@"123",@"1234", nil];
    self.usernameField.delegate = self;
    self.passwordField.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RegisterViewController *vc3 =segue.destinationViewController;
    vc3.userArrayGet = self.userArray;
//    vc3.passwordArrayGet = self.passwordArray;

}

- (IBAction)login:(id)sender {
    NSString * username = self.usernameField.text;
    NSString * password = self.passwordField.text;
    NSString * userpass = [NSString stringWithFormat:@"%@%@",username,password];
//    for (NSString * names in self.userArray){
//        NSLog(@"vc1:%@",names);
//    }
    
    if ([self.userArray indexOfObject:userpass] == NSNotFound) {
        self.viewText.text = [NSString stringWithFormat:@"無此帳號，請先註冊或重新輸入"];
    }else{
    int ui=[self.userArray indexOfObject:userpass];
    if ([userpass isEqualToString:[self.userArray objectAtIndex:ui]]) {
        
        LoginViewController * vc2 =[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        vc2.loginname = username;
        
        self.viewText.text = Nil;
        self.usernameField.text = Nil;
        self.passwordField.text = Nil;
        
        [self showViewController:vc2 sender:nil];
        }
    }
    
}


- (IBAction)register:(id)sender {
    RegisterViewController * vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    self.viewText.text = Nil;
    self.usernameField.text = nil;
    self.passwordField.text = nil;
    [self showViewController:vc3 sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
