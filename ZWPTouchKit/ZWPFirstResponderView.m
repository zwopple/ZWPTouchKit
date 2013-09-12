#import "ZWPFirstResponderView.h"
#import "UIView+ZWPTouchExtensions.h"


@implementation ZWPFirstResponderView

- (BOOL)canBecomeFirstResponder {
	return YES;
}
- (BOOL)canResignFirstResponder {
	return YES;
}
- (BOOL)becomeFirstResponder {
	return YES;
}
- (BOOL)resignFirstResponder {
	return YES;
}
- (instancetype)init {
	if((self = [super init])) {
		self.userInteractionEnabled = YES;
		self.multipleTouchEnabled = NO;
	}
	return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder {
	if((self = [super initWithCoder:coder])) {
		self.userInteractionEnabled = YES;
		self.multipleTouchEnabled = NO;
	}
	return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
	if((self = [super initWithFrame:frame])) {
		self.userInteractionEnabled = YES;
		self.multipleTouchEnabled = NO;
	}
	return self;
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	if(CGRectContainsPoint(self.bounds, [touch locationInView:self])) {
		UIResponder *firstResponder = [self.window closestFirstResponder];
		if(firstResponder != nil) {
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
				[firstResponder resignFirstResponder];
				[self becomeFirstResponder];
			});
		}
	}
}

@end
