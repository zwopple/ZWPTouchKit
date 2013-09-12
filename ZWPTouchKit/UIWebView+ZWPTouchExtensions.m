#import "UIWebView+ZWPTouchExtensions.h"
#import "UIView+ZWPTouchExtensions.h"


@implementation UIWebView (ZWPTouchExtensions)

- (void)setScrollEnabled:(BOOL)value {
	for(UIView *sv in self.subviews) {
		if([sv isKindOfClass:[UIScrollView class]]) {
			[(UIScrollView *)sv setScrollEnabled:value];
			[(UIScrollView *)sv setBounces:NO];
		}
	}
}
- (void)loadHTMLString:(NSString *)hTMLString baseURL:(NSURL *)baseURL waitUntilDone:(BOOL)waitUntilDone {
	if(!waitUntilDone) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[self loadHTMLString:hTMLString baseURL:baseURL];
		});
	} else {
		BOOL started = NO;
		do {
			if(!started) {
				[self loadHTMLString:hTMLString baseURL:baseURL];
				started = YES;
			}
			[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
		} while(![self isLoading]);
		do {
			[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
		} while([self isLoading]);
	}
}
- (CGSize)sizeThatFits:(CGSize)size {
	CGSize s = [super sizeThatFits:size];
	s.height = MIN(s.height, [[self stringByEvaluatingJavaScriptFromString:@"document.height"] doubleValue]);
	return s;
}
- (void)sizeHeightToFit {
    CGRect frame = self.frame;
    frame.size.height = [[self stringByEvaluatingJavaScriptFromString:@"document.height"] doubleValue];
    self.frame = frame;
}

@end
