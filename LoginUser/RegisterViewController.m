//
//  RegisterViewController.m
//  LoginUser
//
//  Created by 黃彥程 on 2016/2/2.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import "RegisterViewController.h"
#import "ViewController.h"
@interface RegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *viewReg;
@property (weak, nonatomic) IBOutlet UITextField *registername;
@property (weak, nonatomic) IBOutlet UITextField *registpassword;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.registername.delegate = self;
    self.registpassword.delegate = self;
    self.viewReg.text = Nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)goback2:(id)sender {

    NSString * userlogin = [NSString stringWithFormat:@"%@%@",self.registername.text,self.registpassword.text];
    if ([self.userArrayGet indexOfObject:userlogin] == NSNotFound && self.registername.text.length !=NULL) {
        [self.userArrayGet addObject:userlogin];
//        [self.passwordArrayGet addObject:self.registpassword.text];

        NSLog(@"user:%@",self.registername.text);
        NSLog(@"password:%@",self.registpassword.text);
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else{
    
        self.viewReg.text = [NSString stringWithFormat:@"此帳號已存在或是無效"];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
