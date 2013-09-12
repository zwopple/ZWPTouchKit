#import <UIKit/UIKit.h>

extern UIViewAutoresizing UIViewAutoresizingMaskAll;

@interface UIView (ZWPTouchExtensions)

#pragma mark - Responder

@property (strong, readonly) UIResponder *closestFirstResponder;

@end
