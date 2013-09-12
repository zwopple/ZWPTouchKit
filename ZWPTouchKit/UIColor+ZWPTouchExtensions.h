#import <UIKit/UIKit.h>

@interface UIColor (ZWPTouchExtensions)

+ (UIColor *)colorWithRGB:(NSUInteger)rgb;
+ (UIColor *)colorWithRGBA:(NSUInteger)rgba;
+ (UIColor *)colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha;

@end
