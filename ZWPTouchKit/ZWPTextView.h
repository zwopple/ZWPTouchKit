#import <UIKit/UIKit.h>

@interface ZWPTextView : UITextView {
}

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, strong, readonly) UILabel *placeholderLabel;

@end
