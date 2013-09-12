#import "ZWPGradientView.h"

NSString *ZWPGradientViewTypeLinear = @"linear";
NSString *ZWPGradientViewTypeRadial = @"radial";

@implementation ZWPGradientView

#pragma mark - Properties

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame {
	if((self = [super initWithFrame:frame])) {
		self.opaque = NO;
		self.backgroundColor = [UIColor clearColor];
		_startPoint = CGPointZero;
		_endPoint = CGPointMake(1.0, 1.0);
		_type = ZWPGradientViewTypeRadial;
	}
	return self;
}

#pragma mark -  UIView

- (void)drawRect:(CGRect)rect {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	if(_colors == nil || (_locations != nil && [_colors count] != [_locations count])) {
		CGContextClearRect(ctx, rect);
		return;
	}
	
	CGContextSaveGState(ctx);
	CGContextClearRect(ctx, rect);
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGFloat *primitiveLocations = nil;
	if(_locations != nil) {
		primitiveLocations = (CGFloat *)malloc(sizeof(CGFloat) * _locations.count);
		NSInteger i = 0;
		for(NSNumber *number in _locations) {
			primitiveLocations[i++] = [number floatValue];
		}
	}
	
	NSMutableArray *primitiveColours = [NSMutableArray arrayWithCapacity:_colors.count];
	for(UIColor *color in _colors) {
		[primitiveColours addObject:(id)color.CGColor];
	}
	
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)primitiveColours, primitiveLocations);
	
	CGPoint p1 = CGPointMake(_startPoint.x * self.bounds.size.width, _startPoint.y * self.bounds.size.height);
	CGPoint p2 = CGPointMake(_endPoint.x * self.bounds.size.width, _endPoint.y * self.bounds.size.height);
	CGFloat d = sqrtf((p2.x - p1.x) * (p2.x - p1.x) + (p2.y - p1.y) * (p2.y - p1.y));
	
	if([_type isEqualToString:ZWPGradientViewTypeLinear]) {
		CGContextDrawLinearGradient(ctx, gradient, p1, p2, (kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation));
	} else if([_type isEqualToString:ZWPGradientViewTypeRadial]) {
		CGContextDrawRadialGradient(ctx, gradient, p1, 0.0, p1, d, (kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation));
	}
	
	CGGradientRelease(gradient);
	if(primitiveLocations != nil) {
		free(primitiveLocations);
	}
	CGColorSpaceRelease(colorSpace);
	
	CGContextRestoreGState(ctx);
}

@end
