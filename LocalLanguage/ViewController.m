//
//  ViewController.m
//  LocalLanguage
//
//  Created by JMiMac01 on 2017/9/27.
//  Copyright © 2017年 JMiMac01. All rights reserved.
//

#import "ViewController.h" 
#import "NSBundle+Language.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _textView.text = NSLocalizedStringFromTable(@"123",@"farmer", nil);
    _label.text = NSLocalizedStringFromTable(@"四川阿坝藏族自治州", @"farmer", nil);
    [_btn1 setTitle: NSLocalizedStringFromTable(@"切换到藏语", @"farmer", nil) forState:UIControlStateNormal];
    [_btn2 setTitle: NSLocalizedStringFromTable(@"切换到中文", @"farmer", nil) forState:UIControlStateNormal];
}

- (IBAction)changeToZang:(id)sender {
     [self changeLanguageTo:@"en"];
}

- (IBAction)changeToCN:(id)sender {
    
    [self changeLanguageTo:@"zh-Hans"];
}

- (void)changeLanguageTo:(NSString *)language {
    // 设置语言
    [NSBundle setLanguage:language];
    
    // 然后将设置好的语言存储好，下次进来直接加载 这次设置之后需要等下次进来才会生效，所以就加一个设置完了之后就退出
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"myLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    exit(1);
}

@end
