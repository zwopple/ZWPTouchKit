#import <UIKit/UIKit.h>

enum {
    UIImageResizeModeScaleToFill,
    UIImageResizeModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
    UIImageResizeModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
    UIImageResizeModeCenter,              // contents remain same size. positioned adjusted.
    UIImageResizeModeTop,
    UIImageResizeModeBottom,
    UIImageResizeModeLeft,
    UIImageResizeModeRight,
    UIImageResizeModeTopLeft,
    UIImageResizeModeTopRight,
    UIImageResizeModeBottomLeft,
    UIImageResizeModeBottomRight,
};
typedef NSUInteger UIImageResizeMode;

@interface UIImage (ZWPTouchExtensions)

#pragma mark - Stretchable

- (UIImage *)resizableHorizontalImage;
- (UIImage *)resizableVerticalImage;
- (UIImage *)resizableImage;

#pragma mark - Orientation

- (UIImage *)imageWithNormalizedOrientation;
- (UIImage *)imageWithNormalizedOrientationWithMaxSize:(CGSize)size;

#pragma mark - Resizing

- (UIImage *)resizedImageWithSize:(CGSize)size mode:(UIImageResizeMode)mode;

@end
