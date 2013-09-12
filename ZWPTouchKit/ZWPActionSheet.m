#import "ZWPActionSheet.h"

@interface  ZWPActionSheet() {
}

#pragma mark - Properties

@property (nonatomic, copy) void (^completionHandler)(ZWPActionSheet *actionSheet, NSInteger buttonIndex);

@end
@implementation ZWPActionSheet

#pragma mark - Properties

#pragma mark - UIView

- (void)willMoveToSuperview:(UIView *)newSuperview {
	if(newSuperview == nil) {
		_completionHandler = nil;
	}
	[super willMoveToSuperview:newSuperview];
}

#pragma mark - Actions

- (void)showFromTabBar:(UITabBar *)tabBar completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on ZWActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	_completionHandler = completionHandler;
	[self showFromTabBar:tabBar];
}
- (void)showFromToolbar:(UIToolbar *)toolBar completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on ZWActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	_completionHandler = completionHandler;
	[self showFromToolbar:toolBar];
}
- (void)showInView:(UIView *)view completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on ZWActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	_completionHandler = completionHandler;
	[self showInView:view];
}
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on ZWActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	_completionHandler = completionHandler;
	[self showFromBarButtonItem:item animated:animated];
}
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(void (^)(ZWPActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on ZWActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	_completionHandler = completionHandler;
	[self showFromRect:rect inView:view animated:animated];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(self.completionHandler) {
		self.completionHandler(self, buttonIndex);
	}
}

@end
