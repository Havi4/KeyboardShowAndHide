//
//  MainViewController.m
//  KeyHideAndShow
//
//  Created by Havi_li on 15/2/5.
//  Copyright (c) 2015年 Havi_li. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *text1;
@property (nonatomic, strong) UITextField *text2;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.keybordView = self.view;
//    self.keybordheight = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    self.text1 = [[UITextField alloc]initWithFrame:CGRectMake(100, 500, 220, 40)];
    self.keybordheight = _text1.frame.origin.y + _text1.frame.size.height;
    _text1.delegate = self;
    _text1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_text1];
    
     _text2 = [[UITextField alloc]initWithFrame:CGRectMake(100, 400, 220, 40)];
    _text2.delegate = self;
    _text2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_text2];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _text1) {
        
    }
    [textField resignFirstResponder];
    return YES;
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
