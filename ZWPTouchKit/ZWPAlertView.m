#import "ZWPAlertView.h"

@interface ZWPAlertView() <UIAlertViewDelegate> {
	
}

#pragma mark - Properties

@property (nonatomic, copy) void (^completionHandler)(ZWPAlertView *alertView, NSInteger buttonIndex);

@end
@implementation ZWPAlertView

#pragma mark - Properties

#pragma mark - Initialization

+ (instancetype)alertViewWithError:(NSError *)error {
	return [[self alloc] initWithError:error];
}
- (instancetype)initWithError:(NSError *)error {
	if((self = [super init])) {
		self.title = [error.userInfo objectForKey:NSLocalizedDescriptionKey];
		self.message = [error.userInfo objectForKey:NSLocalizedRecoverySuggestionErrorKey];
		NSArray *options = [error.userInfo objectForKey:NSLocalizedRecoveryOptionsErrorKey];
		if(options == nil || options.count == 0) {
			options = @[NSLocalizedString(@"Dismiss", @"Dismiss")];
		}
		for(NSString *option in options) {
			[self addButtonWithTitle:option];
		}
		self.cancelButtonIndex = self.numberOfButtons - 1;
	}
	return self;
}

#pragma mark - Actions

- (void)showWithCompletionHandler:(void (^)(ZWPAlertView *alertView, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate because completion handler will be used.");
		self.delegate = nil;
	}
	self.delegate = self;
	self.completionHandler = completionHandler;
	[self show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if(self.completionHandler) {
		self.completionHandler(self, buttonIndex);
	}
}

@end
