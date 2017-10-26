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


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    TextWithRange *textWithRange = [self.textWithColor objectAtIndex:indexPath.row];
    
    [self.delegate removeForegroundColorAttributeWithRange: textWithRange.range];
    [self.textWithColor removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"colorTextCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    cell.textLabel.numberOfLines = 0;
    TextWithRange *textWithRange = [self.textWithColor objectAtIndex:indexPath.row];
    cell.textLabel.attributedText = textWithRange.text;
    
    return cell;
}

@end
