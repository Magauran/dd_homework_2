//
//  TextWithRange.h
//  ColorText
//
//  Created by Алексей on 27.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextWithRange : NSObject<NSCopying>

@property (nonatomic) NSAttributedString * _Nonnull text;
@property (nonatomic) NSRange range;

- (id _Nonnull )initWithText:(NSAttributedString *_Nonnull)text
             range:(NSRange)range;
- (nonnull id)copyWithZone:(nullable NSZone *)zone;

@end
