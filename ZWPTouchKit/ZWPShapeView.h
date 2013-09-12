#import <UIKit/UIKit.h>


#define ZWPShapeViewFillRuleNonZero kCAFillRuleNonZero
#define ZWPShapeViewFillRuleEvenOdd kCAFillRuleEvenOdd

#define ZWPShapeViewLineJoinMiter kCALineJoinMiter
#define ZWPShapeViewLineJoinRound kCALineJoinRound
#define ZWPShapeViewLineJoinBevel kCALineJoinBevel

#define ZWPShapeViewLineCapButt kCALineCapButt
#define ZWPShapeViewLineCapRound kCALineCapRound
#define ZWPShapeViewLineCapSquare kCALineCapSquare

@interface ZWPShapeView : UIView

#pragma mark - Properties

@property (nonatomic, copy) UIBezierPath *path;
@property (nonatomic, copy) UIColor *fillColor;
@property (nonatomic, copy) NSString *fillRule;
@property (nonatomic, copy) NSString *lineCap;
@property (nonatomic, copy) NSArray *lineDashPattern;
@property (nonatomic, assign) CGFloat lineDashPhase;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, copy) NSString *lineJoin;
@property (nonatomic, assign) CGFloat miterLimit;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeStart;
@property (nonatomic, assign) CGFloat strokeEnd;

@end
