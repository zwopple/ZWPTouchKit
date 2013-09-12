#import <UIKit/UIKit.h>

@protocol ZWApplicationStateDelegate <NSObject>

@required

- (void)applicationWillEnterForegroundNotification:(NSNotification *)notification;
- (void)applicationDidEnterBackgroundNotification:(NSNotification *)notification;

@end

extern void ZWApplicationStateDelegateToggleNotificationObservers(id <ZWApplicationStateDelegate> target, BOOL toggled);
extern void ZWApplicationStateDelegateAddNotificationObservers(id <ZWApplicationStateDelegate> target);
extern void ZWApplicationStateDelegateRemoveNotificationObservers(id <ZWApplicationStateDelegate> target);

