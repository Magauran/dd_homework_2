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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:true];
    [self.textView setContentOffset:CGPointZero];
}


- (IBAction)changeTextColor:(UIButton *)sender {
    NSRange range = self.textView.selectedRange;
    if (!range.length) {
        range = NSMakeRange(0, self.textView.text.length);
    }
    [self.textView.textStorage addAttribute:NSForegroundColorAttributeName value:sender.currentTitleColor range: range];
}


- (IBAction)clearButton:(UIButton *)sender {
    NSRange range = self.textView.selectedRange;
    if (!range.length) {
        range = NSMakeRange(0, self.textView.text.length);
    }
    [self removeForegroundColorAttributeWithRange:range];
}


- (IBAction)viewListButton:(UIButton *)sender {
    NSMutableArray *textWithColor = [[[NSMutableArray alloc] init] autorelease];
    
    [self.textView.textStorage enumerateAttribute:NSForegroundColorAttributeName inRange:NSMakeRange(0, self.textView.text.length) options:0 usingBlock:^(id value, NSRange range, BOOL *stop) {
        if (value) {
            NSAttributedString *text = (NSAttributedString *)[self.textView.textStorage attributedSubstringFromRange:range];
            TextWithRange *textWithRange = [[TextWithRange alloc] initWithText:text range:range];
            [textWithColor addObject:textWithRange];
            [textWithRange release];
        }
    }];
    
    self.textView.selectedRange = NSMakeRange(0, 0);
    [self performSegueWithIdentifier:@"showListOfTextSegue" sender:textWithColor];
}


- (void)removeForegroundColorAttributeWithRange:(NSRange)range {
    [self.textView.textStorage removeAttribute:NSForegroundColorAttributeName range:range];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showListOfTextSegue"]) {
        ListOfTextViewController *controller = (ListOfTextViewController *)segue.destinationViewController;
        ViewController *firstController = (ViewController *)segue.sourceViewController;
        [controller setTextWithColor:sender];
        controller.delegate = firstController;
    }
}

@end
