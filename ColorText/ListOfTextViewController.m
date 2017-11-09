//
//  ListOfTextViewController.m
//  ColorText
//
//  Created by Алексей on 19.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import "ListOfTextViewController.h"

@implementation ListOfTextViewController

- (void)dealloc {
    [_textWithColor removeAllObjects];
    _textWithColor = nil;
    [_textWithColor release];
    [super dealloc];
}


- (IBAction)backToTextButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.textWithColor.count;
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
    TextWithRange *textWithRange = [self.textWithColor objectAtIndex:indexPath.row];
    cell.textLabel.attributedText = textWithRange.text;
    cell.textLabel.numberOfLines = 0;
    return cell;
}

@end
