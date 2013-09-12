#import "UIView+ZWPTouchExtensions.h"

UIViewAutoresizing UIViewAutoresizingMaskAll = (UIViewAutoresizingFlexibleWidth |
												UIViewAutoresizingFlexibleHeight |
												UIViewAutoresizingFlexibleTopMargin |
												UIViewAutoresizingFlexibleBottomMargin |
												UIViewAutoresizingFlexibleLeftMargin |
												UIViewAutoresizingFlexibleRightMargin);

@implementation UIView (ZWPTouchExtensions)

#pragma mark - Responder

@dynamic closestFirstResponder;

- (UIResponder *)closestFirstResponder {
	if([self isFirstResponder]) {
		return self;
	}
	for(UIView *sv in self.subviews) {
		if([sv isFirstResponder]) {
			return sv;
		}
	}
	for(UIView *sv in self.subviews) {
		UIResponder *r = [sv closestFirstResponder];
		if(r != nil) {
			return r;
		}
	}
	return nil;
}

@end
