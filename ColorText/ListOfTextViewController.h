//
//  ListOfTextViewController.h
//  ColorText
//
//  Created by Алексей on 19.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import "ViewController.h"

@interface ListOfTextViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) id<ViewControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableArray * textWithColor;

@end
