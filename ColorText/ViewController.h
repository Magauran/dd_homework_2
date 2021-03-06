//
//  ViewController.h
//  ColorText
//
//  Created by Алексей on 11.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import "TextWithRange.h"

@protocol ViewControllerDelegate <NSObject>

- (void)removeForegroundColorAttributeWithRange:(NSRange)range;

@end


@interface ViewController : UIViewController <ViewControllerDelegate>

@property (assign, nonatomic) IBOutlet UITextView *textView;

@end



