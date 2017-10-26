//
//  ListOfTextViewController.h
//  ColorText
//
//  Created by Алексей on 19.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ListOfTextViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<ViewControllerDelegate> delegate;
@property (nonatomic) NSMutableArray * textWithColor;

@end
