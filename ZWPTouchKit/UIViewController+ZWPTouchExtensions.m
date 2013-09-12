#import "UIViewController+ZWPTouchExtensions.h"

@implementation UIViewController (ZWPTouchExtensions)

#pragma mark - Properties

@dynamic isViewLoaded;
@dynamic isViewVisible;

- (BOOL)isViewVisible {
	if([self isViewLoaded]) {
		return (self.view.window != nil && self.view.superview != nil);
	}
	return NO;
}

@end
