#import "UIDevice+ZWPTouchExtensions.h"

@implementation UIDevice (ZWPTouchExtensions)

@dynamic phoneSupported;

- (BOOL)isPhoneSupported {
	return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://5555555555"]];
}

@end
