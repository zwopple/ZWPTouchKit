#import "ZWPShapeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ZWPShapeView

#pragma mark - Properties

#pragma mark - Properties

@dynamic fillRule;
@dynamic lineCap;
@dynamic lineDashPattern;
@dynamic lineDashPhase;
@dynamic lineWidth;
@dynamic lineJoin;
@dynamic miterLimit;
@dynamic strokeStart;
@dynamic strokeEnd;

+ (Class)layerClass {
	return [CAShapeLayer class];
}

- (void)setPath:(UIBezierPath *)value {
	_path = value;
	[(CAShapeLayer *)self.layer setPath:_path.CGPath];
}
- (void)setFillColor:(UIColor *)value {
	_fillColor = value;
	[(CAShapeLayer *)self.layer setFillColor:_fillColor.CGColor];
}

- (NSString *)fillRule {
	return [(CAShapeLayer *)self.layer fillRule];
}
- (void)setFillRule:(NSString *)value {
	[(CAShapeLayer *)self.layer setFillRule:value];
}
- (NSString *)lineCap {
	return [(CAShapeLayer *)self.layer lineCap];
}
- (void)setLineCap:(NSString *)value {
	[(CAShapeLayer *)self.layer setLineCap:value];
}
- (NSArray *)lineDashPattern {
	return [(CAShapeLayer *)self.layer lineDashPattern];
}
- (void)setLineDashPattern:(NSArray *)value {
	[(CAShapeLayer *)self.layer setLineDashPattern:value];
}
- (CGFloat)lineDashPhase {
	return [(CAShapeLayer *)self.layer lineDashPhase];
}
- (void)setLineDashPhase:(CGFloat)value {
	[(CAShapeLayer *)self.layer setLineDashPhase:value];
}
- (CGFloat)lineWidth {
	return [(CAShapeLayer *)self.layer lineWidth];
}
- (void)setLineWidth:(CGFloat)value {
	[(CAShapeLayer *)self.layer setLineWidth:value];
}
- (NSString *)lineJoin {
	return [(CAShapeLayer *)self.layer lineJoin];
}
- (void)setLineJoin:(NSString *)value {
	[(CAShapeLayer *)self.layer setLineJoin:value];
}
- (CGFloat)miterLimit {
	return [(CAShapeLayer *)self.layer miterLimit];
}
- (void)setMiterLimit:(CGFloat)value {
	[(CAShapeLayer *)self.layer setMiterLimit:value];
}
- (CGFloat)strokeStart {
	return [(CAShapeLayer *)self.layer strokeStart];
}
- (void)setStrokeStart:(CGFloat)value {
	[(CAShapeLayer *)self.layer setStrokeStart:value];
}
- (CGFloat)strokeEnd {
	return [(CAShapeLayer *)self.layer strokeEnd];
}
- (void)setStrokeEnd:(CGFloat)value {
	[(CAShapeLayer *)self.layer setStrokeEnd:value];
}

- (void)setStrokeColor:(UIColor *)value {
	_strokeColor = value;
	[(CAShapeLayer *)self.layer setStrokeColor:_strokeColor.CGColor];
}

@end
