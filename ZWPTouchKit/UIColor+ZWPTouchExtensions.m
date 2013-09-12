#import "UIColor+ZWPTouchExtensions.h"

@implementation UIColor (ZWPTouchExtensions)

+ (UIColor *)colorWithRGB:(NSUInteger)rgb {
	return [self colorWithRGB:rgb alpha:1.0];
}
+ (UIColor *)colorWithRGBA:(NSUInteger)rgba {
	return [UIColor colorWithRed:(((rgba >> 24) & 0xFF) / 255.0) 
						   green:(((rgba >> 16) & 0xFF) / 255.0)
							blue:(((rgba >> 8) & 0xFF) / 255.0)
						   alpha:(((rgba >> 0) & 0xFF) / 255.0)];
}
+ (UIColor *)colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha {
	return [UIColor colorWithRed:(((rgb >> 16) & 0xFF) / 255.0) 
						   green:(((rgb >> 8) & 0xFF) / 255.0)
							blue:(((rgb >> 0) & 0xFF) / 255.0)
						   alpha:alpha];
}

@end
