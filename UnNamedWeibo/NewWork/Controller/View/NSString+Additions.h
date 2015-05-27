//
//  NSString+Additions.h
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
@interface NSString (Additions)

#pragma mark - java api
- (NSUInteger) compareTo: (NSString*) comp;
- (NSUInteger) compareToIgnoreCase: (NSString*) comp;
- (BOOL) contains: (NSString*) substring;
- (BOOL) endsWith: (NSString*) substring;
- (BOOL) startsWith: (NSString*) substring;
- (NSUInteger) indexOf: (NSString*) substring;
- (NSUInteger) indexOf:(NSString *)substring startingFrom: (NSUInteger) index;
- (NSUInteger) lastIndexOf: (NSString*) substring;
- (NSUInteger) lastIndexOf:(NSString *)substring startingFrom: (NSUInteger) index;
- (NSString*) substringFromIndex:(NSUInteger)from toIndex: (NSUInteger) to;
- (NSString*) trim;
- (NSArray*) split: (NSString*) token;
- (NSString*) replace: (NSString*) target withString: (NSString*) replacement;
- (NSArray*) split: (NSString*) token limit: (NSUInteger) maxResults;

- (CGSize)sizeWithConstrainedToWidth:(CGFloat)width fromFont:(UIFont *)font1 lineSpace:(CGFloat)lineSpace;
- (CGSize)sizeWithConstrainedToSize:(CGSize)size fromFont:(UIFont *)font1 lineSpace:(CGFloat)lineSpace;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(CGFloat)height andWidth:(CGFloat)width;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(CGFloat)height;

@end
