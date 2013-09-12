#import "UIBarButtonItem+ZWPTouchExtensions.h"


@implementation UIBarButtonItem (ZWPTouchExtensions)

+ (instancetype)flexibleSpaceBarButtonItem {
	return [[self alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}
+ (instancetype)fixedSpaceBarButtonItemWithWidth:(CGFloat)width {
	UIBarButtonItem *bbi = [[self alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
	bbi.width = width;
	return bbi;
}
+ (instancetype)barButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action {
	return [(UIBarButtonItem *)[self alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
}
+ (instancetype)barButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
	return [(UIBarButtonItem *)[self alloc] initWithTitle:title style:style target:target action:action];
}
+ (instancetype)barButtonItemWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
	return [(UIBarButtonItem *)[self alloc] initWithImage:image style:style target:target action:action];
}
+ (instancetype)barButtonItemWithCustomView:(UIView *)customView target:(id)target action:(SEL)action {
	UIBarButtonItem *bbi = [[self alloc] initWithCustomView:customView];
	[bbi setTarget:target];
	[bbi setAction:action];
	return bbi;
}

- (void)setTarget:(id)target action:(SEL)action {
	self.target = target;
	self.action = action;
}

@end
