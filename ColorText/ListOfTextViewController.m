//
//  ListOfTextViewController.m
//  ColorText
//
//  Created by Алексей on 19.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import "ListOfTextViewController.h"

@implementation ListOfTextViewController

- (IBAction)backToTextButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.textWithColor.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"colorTextCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.attributedText = [self.textWithColor objectAtIndex:indexPath.row];
    
    return cell;
}

@end
