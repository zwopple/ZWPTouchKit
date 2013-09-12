#import "ZWPTextView.h"

@interface ZWPTextView() {
	
}

- (void)ZWPTextView_init;
- (void)textDidChangeNotification:(NSNotification *)notification;

@end
@implementation ZWPTextView

#pragma mark - Properties

- (void)setPlaceholder:(NSString *)value {
	_placeholder = [value copy];
	_placeholderLabel.text = value;
    CGRect frame = _placeholderLabel.frame;
    frame.size = [_placeholderLabel sizeThatFits:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX)];
    self.frame = frame;
	[_placeholderLabel setNeedsLayout];
	[_placeholderLabel setNeedsDisplay];
	[self setNeedsLayout];
}
- (void)setFont:(UIFont *)value {
	[super setFont:value];
	_placeholderLabel.font = self.font;
}
- (CGSize)intrinsicContentSize {
	CGSize s = [super intrinsicContentSize];
	s.width = MAX(s.width, _placeholderLabel.intrinsicContentSize.width + 16.0);
	s.height = MAX(s.height, _placeholderLabel.intrinsicContentSize.height + 16.0);
	return s;
}

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame {
	if((self = [super initWithFrame:frame])) {
		[self ZWPTextView_init];
	}
	return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder {
	if((self = [super initWithCoder:coder])) {
		[self ZWPTextView_init];
	}
	return self;
}
- (void)ZWPTextView_init {
	_placeholder = @"";
	_placeholderColor = [UIColor colorWithRed:.701960784 green:.701960784 blue:.701960784 alpha:1.0];
	
	_placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16.0, self.bounds.size.height)];
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
	_placeholderLabel.lineBreakMode = UILineBreakModeWordWrap;
#else
	_placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
#endif
	_placeholderLabel.numberOfLines = 0;
	_placeholderLabel.font = self.font;
	_placeholderLabel.backgroundColor = [UIColor clearColor];
	_placeholderLabel.textColor = _placeholderColor;
	_placeholderLabel.text = _placeholder;
    CGRect frame = _placeholderLabel.frame;
    frame.size = [_placeholderLabel sizeThatFits:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX)];
    _placeholderLabel.frame = frame;
	[self addSubview:_placeholderLabel];
	[self sendSubviewToBack:_placeholderLabel];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextViewTextDidChangeNotification object:self];
	[self textDidChangeNotification:nil];
}

#pragma mark - Notifications

- (void)textDidChangeNotification:(NSNotification *)notification {
	if(self.placeholder.length > 0) {
		if ([self.text length] == 0) {
			_placeholderLabel.alpha = 1.0;
		} else {
			_placeholderLabel.alpha = 0.0;
		}
	}
}

#pragma mark - UIView

- (void)layoutSubviews {
	[super layoutSubviews];
	CGRect r = _placeholderLabel.frame;
	r.size.width = self.bounds.size.width - 16;
	_placeholderLabel.frame = r;
}

#pragma mark - Dealloc

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}

@end
