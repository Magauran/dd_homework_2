//
//  ViewController.m
//  ColorText
//
//  Created by Алексей on 11.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textView;

- (IBAction)changeTextColor:(UIButton *)sender {
    NSRange range = [self.textView selectedRange];
    if (!range.length) {
        range = NSMakeRange(0, self.textView.text.length);
    }
    [self.textView.textStorage addAttribute:NSForegroundColorAttributeName value:sender.currentTitleColor range: range];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
