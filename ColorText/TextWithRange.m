//
//  TextWithRange.m
//  ColorText
//
//  Created by Алексей on 27.10.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

#import "TextWithRange.h"

@implementation TextWithRange

- (id)initWithText:(NSAttributedString *)text
             range:(NSRange)range {
    if (self = [super init]) {
        self.text = text;
        self.range = range;
    }
    return self;
}


- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    id copy = [[[self class] alloc] initWithText:self.text range:self.range];
    return copy;
}

@end
