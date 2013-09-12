#import <UIKit/UIKit.h>


@interface ZWPActionSheet : UIActionSheet {
}

#pragma mark - Properties

@property (nonatomic, strong) id userInfo;

#pragma mark - Actions

- (void)showFromTabBar:(UITabBar *)tabBar completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;
- (void)showFromToolbar:(UIToolbar *)toolBar completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;
- (void)showInView:(UIView *)view completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;

@end
