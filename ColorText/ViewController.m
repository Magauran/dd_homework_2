//
//  ViewController.m
//  ColorText
//
//  Created by Алексей on 11.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import "ViewController.h"
#import "ListOfTextViewController.h"

@implementation ViewController

- (IBAction)changeTextColor:(UIButton *)sender {
    NSRange range = [self.textView selectedRange];
    if (!range.length) {
        range = NSMakeRange(0, self.textView.text.length);
    }
    [self.textView.textStorage addAttribute:NSForegroundColorAttributeName value:sender.currentTitleColor range: range];
}

- (IBAction)clearButton:(UIButton *)sender {
    NSRange range = [self.textView selectedRange];
    if (!range.length) {
        range = NSMakeRange(0, self.textView.text.length);
    }
    [self.textView.textStorage removeAttribute:NSForegroundColorAttributeName range:range];
}

- (IBAction)viewListButton:(UIButton *)sender {
    NSMutableArray* textWithColor = [[NSMutableArray alloc] init];
    [self.textView.textStorage enumerateAttribute:NSForegroundColorAttributeName inRange:NSMakeRange(0, self.textView.text.length) options:0 usingBlock:^(id value, NSRange range, BOOL *stop) {
        if (value) {
            NSAttributedString *text = [self.textView.textStorage attributedSubstringFromRange:range];
            [textWithColor addObject:text];
        }
    }];
    [self performSegueWithIdentifier:@"showListOfTextSegue" sender:textWithColor];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showListOfTextSegue"]){
        ListOfTextViewController *controller = (ListOfTextViewController *)segue.destinationViewController;
        [controller setTextWithColor:sender];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
}

@end
