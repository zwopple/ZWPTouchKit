#import "ZWKeyboardDelegate.h"

void ZWKeyboardDelegateToggleNotificationObservers(id <ZWKeyboardDelegate> target, BOOL toggled) {
	NSArray *selectorNames = @[@"keyboardWillShowNotification:", @"keyboardDidShowNotification:", @"keyboardWillHideNotification:", @"keyboardDidHideNotification:"];
	NSArray *notificationNames = @[UIKeyboardWillShowNotification, UIKeyboardDidShowNotification, UIKeyboardWillHideNotification, UIKeyboardDidHideNotification];
	[notificationNames enumerateObjectsUsingBlock:^(NSString *notificationName, NSUInteger idx, BOOL *stop) {
		SEL selector = NSSelectorFromString([selectorNames objectAtIndex:idx]);
		if([target respondsToSelector:selector]) {
			if(toggled) {
				[[NSNotificationCenter defaultCenter] addObserver:target
														 selector:selector
															 name:notificationName
														   object:nil];
			} else {
				[[NSNotificationCenter defaultCenter] removeObserver:target
																name:notificationName
															  object:nil];
			}
		}
	}];
}
void ZWKeyboardDelegateAddNotificationObservers(id <ZWKeyboardDelegate> target) {
	ZWKeyboardDelegateToggleNotificationObservers(target, YES);
};
void ZWKeyboardDelegateRemoveNotificationObservers(id <ZWKeyboardDelegate> target) {
	ZWKeyboardDelegateToggleNotificationObservers(target, NO);
};
void ZWKeyboardAnimateWithNotification(NSNotification *notification, void (^animations)(void), void (^completion)(BOOL finished)) {
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	UIViewAnimationCurve curve = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
	UIViewAnimationOptions options = 0;
	
	switch(curve) {
		case UIViewAnimationCurveEaseIn :
			options |= UIViewAnimationOptionCurveEaseIn;
			break;
		case UIViewAnimationCurveEaseInOut :
			options |= UIViewAnimationOptionCurveEaseInOut;
			break;
		case UIViewAnimationCurveEaseOut :
			options |= UIViewAnimationOptionCurveEaseOut;
			break;
		case UIViewAnimationCurveLinear :
			options |= UIViewAnimationOptionCurveLinear;
			break;
	}
    
    [UIView animateWithDuration:duration delay:0.0 options:options animations:animations completion:completion];
}