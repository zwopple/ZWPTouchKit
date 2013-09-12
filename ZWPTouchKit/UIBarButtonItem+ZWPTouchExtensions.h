#import <UIKit/UIKit.h>


@interface UIBarButtonItem (ZWPTouchExtensions)

+ (instancetype)flexibleSpaceBarButtonItem;
+ (instancetype)fixedSpaceBarButtonItemWithWidth:(CGFloat)width;

+ (instancetype)barButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action;
+ (instancetype)barButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;
+ (instancetype)barButtonItemWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;
+ (instancetype)barButtonItemWithCustomView:(UIView *)customView target:(id)target action:(SEL)action;

- (void)setTarget:(id)target action:(SEL)action;

@end
