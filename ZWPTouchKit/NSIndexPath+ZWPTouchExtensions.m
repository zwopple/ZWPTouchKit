#import "NSIndexPath+ZWPTouchExtensions.h"

@implementation NSIndexPath (ZWPTouchExtensions)

+ (NSArray *)indexPathsForRowsInRange:(NSRange)range section:(NSUInteger)section {
	NSMutableArray *a = [NSMutableArray arrayWithCapacity:range.length];
	for(NSInteger i = 0; i < range.length; ++i) {
		[a addObject:[NSIndexPath indexPathForRow:i + range.location inSection:section]];
	}
	return a;
}

@end
