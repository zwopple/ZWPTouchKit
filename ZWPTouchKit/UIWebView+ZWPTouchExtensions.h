#import <UIKit/UIKit.h>


@interface UIWebView (ZWPTouchExtensions)

- (void)setScrollEnabled:(BOOL)value;
- (void)loadHTMLString:(NSString *)hTMLString baseURL:(NSURL *)baseURL waitUntilDone:(BOOL)waitUntilDone;
- (void)sizeHeightToFit;

@end
