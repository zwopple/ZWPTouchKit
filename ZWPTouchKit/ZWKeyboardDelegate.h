#import <UIKit/UIKit.h>

@protocol ZWKeyboardDelegate <NSObject>
@optional
- (void)keyboardWillShowNotification:(NSNotification *)notification;
- (void)keyboardDidShowNotification:(NSNotification *)notification;
- (void)keyboardWillHideNotification:(NSNotification *)notification;
- (void)keyboardDidHideNotification:(NSNotification *)notification;
@end

extern void ZWKeyboardDelegateToggleNotificationObservers(id <ZWKeyboardDelegate> target, BOOL toggled);
extern void ZWKeyboardDelegateAddNotificationObservers(id <ZWKeyboardDelegate> target);
extern void ZWKeyboardDelegateRemoveNotificationObservers(id <ZWKeyboardDelegate> target);
extern void ZWKeyboardAnimateWithNotification(NSNotification *notification, void (^animations)(void), void (^completion)(BOOL finished));

