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
    return self.textWithColor.count * 2;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    TextWithRange *textWithRange = [self.textWithColor objectAtIndex:indexPath.row / 2];

    [self.delegate removeForegroundColorAttributeWithRange: textWithRange.range];
    [self.textWithColor removeObjectAtIndex:indexPath.row / 2];
    
    [tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"colorTextCell"];
        TextWithRange *textWithRange = [self.textWithColor objectAtIndex:indexPath.row / 2];
        cell.textLabel.attributedText = textWithRange.text;
        cell.textLabel.numberOfLines = 0;
        
        
        [cell.contentView.layer setCornerRadius:10.0f];
        [cell.contentView.layer setMasksToBounds:YES];
        [cell.contentView.layer setBackgroundColor:[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1].CGColor];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"separatorCell"];
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        return UITableViewAutomaticDimension;
    } else {
        return 10;
    }
}


@end
