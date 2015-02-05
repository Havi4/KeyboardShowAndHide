//
//  BaseViewController.m
//  KeyHideAndShow
//
//  Created by Havi_li on 15/2/5.
//  Copyright (c) 2015年 Havi_li. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    BOOL mIsShowKeyboard;
    CGRect mRectkeybordview;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/**
 *  注册显示keyboard
 *
 *  @param animated <#animated description#>
 */
- (void)viewWillAppear:(BOOL)animated
{
    [self setKeyNotification];
    [super viewWillAppear:animated];
}

- (void)setKeyNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
/**
 *  移除通知
 *
 *  @param animated <#animated description#>
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [super viewWillDisappear:animated];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     Animate the resize so that it's in sync with the appearance of the keyboard.
     */
    
    NSDictionary *userInfo = [notification userInfo];
    [self adjustTextViewByKeyboardState:YES keyboardInfo:userInfo];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
    /*
     Restore the size of the text view (fill self's view).
     Animate the resize so that it's in sync with the disappearance of the keyboard.
     */
    if(!_keybordView){
        return;
    }
    //一个bool值判断这个
    mIsShowKeyboard = NO;
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:0.3];
    _keybordView.frame = mRectkeybordview;
    //参数设置完成之后，才开始进行动画效果，
    [UIView commitAnimations];
    
}

#pragma mark - Responding to keyboard events

- (void)adjustTextViewByKeyboardState:(BOOL)showKeyboard keyboardInfo:(NSDictionary *)info {
    
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     Animate the resize so that it's in sync with the appearance of the keyboard.
     */
    
    // transform the UIViewAnimationCurve to a UIViewAnimationOptions mask
    if(!_keybordView){
        return;
    }
    if(!mIsShowKeyboard){
        mRectkeybordview = _keybordView.frame;
    }
    mIsShowKeyboard = YES;
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:0.3];
    //动画的内容
    
    //动画结束
    
    CGRect rect;
    //此处的keybordView是你当前显示
    [[info objectForKey:UIKeyboardBoundsUserInfoKey] getValue:&rect];
    _keybordView.frame = CGRectMake(mRectkeybordview.origin.x,
                                    mRectkeybordview.origin.y - (self.keybordheight != 0? rect.size.height-(_keybordView.frame.size.height - self.keybordheight): rect.size.height),
                                    mRectkeybordview.size.width,
                                    mRectkeybordview.size.height);
    //    此处的那个view起点就是-70
    [UIView commitAnimations];
    
}

//这个是自己写setter方法
- (void)setKeybordView:(UIView* )view
{
    _keybordView = view;
    mRectkeybordview = _keybordView.frame;
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
