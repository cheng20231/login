//
//  ViewController.h
//  LoginUser
//
//  Created by 黃彥程 on 2016/2/2.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong,nonatomic) NSMutableArray * userArray;
//@property (strong,nonatomic) NSMutableArray * passwordArray;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
@end

