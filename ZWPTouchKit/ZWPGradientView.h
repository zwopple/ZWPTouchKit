#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

extern NSString *ZWPGradientViewTypeLinear;
extern NSString *ZWPGradientViewTypeRadial;

@interface ZWPGradientView : UIView {
}

#pragma mark - Properties

@property (nonatomic, copy) NSArray *colors;
@property (nonatomic, copy) NSArray *locations;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, copy) NSString *type;

@end
