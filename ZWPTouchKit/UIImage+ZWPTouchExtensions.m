#import "UIImage+ZWPTouchExtensions.h"
#import <objc/runtime.h>
#import <objc/objc.h>

@implementation UIImage (ZWPTouchExtensions)

#pragma mark - Stretchable

- (UIImage *)resizableHorizontalImage {
	if(!UIEdgeInsetsEqualToEdgeInsets(self.capInsets, UIEdgeInsetsZero)) {
		return self;
	}
	return [self resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, floorf(self.size.width / 2.0), 0.0, floorf(self.size.width / 2.0))];
}
- (UIImage *)resizableVerticalImage {
	if(!UIEdgeInsetsEqualToEdgeInsets(self.capInsets, UIEdgeInsetsZero)) {
		return self;
	}
	return [self resizableImageWithCapInsets:UIEdgeInsetsMake(floorf(self.size.height / 2.0), 0.0, floorf(self.size.height / 2.0), 0.0)];
}
- (UIImage *)resizableImage {
	if(!UIEdgeInsetsEqualToEdgeInsets(self.capInsets, UIEdgeInsetsZero)) {
		return self;
	}
	return [self resizableImageWithCapInsets:UIEdgeInsetsMake(floorf(self.size.height / 2.0), floorf(self.size.width / 2.0), floorf(self.size.height / 2.0), floorf(self.size.width / 2.0))];
}

#pragma mark - Orientation

- (UIImage *)imageWithNormalizedOrientation {
	return [self imageWithNormalizedOrientationWithMaxSize:CGSizeZero];
}
- (UIImage *)imageWithNormalizedOrientationWithMaxSize:(CGSize)size {
	CGImageRef cgImage = self.CGImage;
	CGFloat width = CGImageGetWidth(cgImage);
	CGFloat height = CGImageGetHeight(cgImage);
	
	CGFloat originalScale = self.scale;
	CGFloat originalWidth = width;
	CGFloat originalHeight = height;
	
	size.width *= originalScale;
	size.height *= originalScale;
	
	CGAffineTransform transform = CGAffineTransformMake(1, 0, 0, -1, 0, size.height);
	switch(self.imageOrientation) {
		case UIImageOrientationUp:
			if(size.width == 0 && size.height == 0) {
				return self;
			}
			break;
			
		case UIImageOrientationUpMirrored:
			transform = CGAffineTransformMakeTranslation(originalWidth, 0.0);
			transform = CGAffineTransformScale(transform, -1.0, 1.0);
			break;
			
		case UIImageOrientationDown:
			transform = CGAffineTransformMakeTranslation(originalWidth, originalHeight);
			transform = CGAffineTransformRotate(transform, M_PI);
			break;
			
		case UIImageOrientationDownMirrored:
			transform = CGAffineTransformMakeTranslation(0.0, originalHeight);
			transform = CGAffineTransformScale(transform, 1.0, -1.0);
			break;
			
		case UIImageOrientationRightMirrored:
			width = height;
			height = originalWidth;
			transform = CGAffineTransformMakeTranslation(originalHeight, originalWidth);
			transform = CGAffineTransformScale(transform, -1.0, 1.0);
			transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
			break;
			
		case UIImageOrientationRight:
			width = height;
			height = originalWidth;
			transform = CGAffineTransformMakeTranslation(0.0, originalWidth);
			transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
			break;
			
		case UIImageOrientationLeftMirrored:
			width = height;
			height = originalWidth;
			transform = CGAffineTransformMakeScale(-1.0, 1.0);
			transform = CGAffineTransformRotate(transform, M_PI / 2.0);
			break;
			
		case UIImageOrientationLeft:
			width = height;
			height = originalWidth;
			transform = CGAffineTransformMakeTranslation(originalHeight, 0.0);
			transform = CGAffineTransformRotate(transform, M_PI / 2.0);
			break;
			
		default :
			[NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
			break;
	}
	
	CGFloat widthScale = ((size.width != 0 && width > size.width) ? size.width / width : 1.0);
	CGFloat heightScale = ((size.height != 0 && height > size.height) ? size.height / height : 1.0);
	CGFloat scale = widthScale < heightScale ? widthScale : heightScale;
	CGRect rect = CGRectMake(0, 0, floorf(width * scale), floorf(height * scale));
	
	CGBitmapInfo bitmapInfo = (CGBitmapInfo)kCGImageAlphaPremultipliedLast;
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	
	CGContextRef ctx = CGBitmapContextCreate(nil,
											 rect.size.width,
											 rect.size.height,
											 8,
											 rect.size.width * 4,
											 colorSpace,
											 bitmapInfo);
	CGColorSpaceRelease(colorSpace);
	CGContextClearRect(ctx, rect);
	CGContextScaleCTM(ctx, scale, scale);
	CGContextConcatCTM(ctx, transform);
	CGContextSetInterpolationQuality(ctx, kCGInterpolationHigh);
	CGContextDrawImage(ctx, CGRectMake(0, 0, originalWidth, originalHeight), cgImage);
	CGImageRef correctedCGImage = CGBitmapContextCreateImage(ctx);
	CGContextRelease(ctx);
	UIImage *correctedImage = [UIImage imageWithCGImage:correctedCGImage];
	CGImageRelease(correctedCGImage);
	
	return correctedImage;
}

#pragma mark - Resizing

- (UIImage *)resizedImageWithSize:(CGSize)size mode:(UIImageResizeMode)mode {
	CGFloat scale = self.scale;
	UIImageOrientation imageOrientation = self.imageOrientation;
	CGSize originalSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
	
	CGRect rect = CGRectZero;
    
    size = CGSizeMake(size.width * scale, size.height * scale);
	
	switch(mode) {
		case UIImageResizeModeTopLeft :
			rect.size = originalSize;
			rect.origin.x = 0.0;
			rect.origin.y = 0.0;
			break;
		case UIImageResizeModeTop :
			rect.size = originalSize;
			rect.origin.x = ((size.width - rect.size.width) / 2.0);
			rect.origin.y = 0.0;
			break;
		case UIImageResizeModeTopRight :
			rect.size = originalSize;
			rect.origin.x = (size.width - rect.size.width);
			rect.origin.y = 0.0;
			break;
			
		case UIImageResizeModeLeft :
			rect.size = originalSize;
			rect.origin.x = 0.0;
			rect.origin.y = ((size.height - rect.size.height) / 2.0);
			break;
		case UIImageResizeModeCenter :
			rect.size = originalSize;
			rect.origin.x = ((size.width - rect.size.width) / 2.0);
			rect.origin.y = ((size.height - rect.size.height) / 2.0);
			break;
		case UIImageResizeModeRight :
			rect.size = originalSize;
			rect.origin.x = (size.width - rect.size.width);
			rect.origin.y = ((size.height - rect.size.height) / 2.0);
			break;
			
		case UIImageResizeModeBottomLeft :
			rect.size = originalSize;
			rect.origin.x = 0.0;
			rect.origin.y = (size.height - rect.size.height);
			break;
		case UIImageResizeModeBottom :
			rect.size = originalSize;
			rect.origin.x = ((size.width - rect.size.width) / 2.0);
			rect.origin.y = (size.height - rect.size.height);
			break;
		case UIImageResizeModeBottomRight :
			rect.size = originalSize;
			rect.origin.x = (size.width - rect.size.width);
			rect.origin.y = (size.height - rect.size.height);
			break;
			
			
		case UIImageResizeModeScaleToFill :
			rect.size = size;
			rect.origin.x = 0.0;
			rect.origin.y = 0.0;
			break;
		case UIImageResizeModeScaleAspectFill :
			rect.size = size;
			if(originalSize.width > originalSize.height) {
				rect.size = CGSizeMake(size.width * (originalSize.width / originalSize.height), size.height);
			} else {
				rect.size = CGSizeMake(size.width, size.height * (originalSize.height / originalSize.width));
			}
			rect.origin.x = ((size.width - rect.size.width) / 2.0);
			rect.origin.y = ((size.height - rect.size.height) / 2.0);
			break;
		case UIImageResizeModeScaleAspectFit :
			rect.size = size;
			if(originalSize.width > originalSize.height) {
				rect.size = CGSizeMake(size.width, size.height * (originalSize.height / originalSize.width));
			} else {
				rect.size = CGSizeMake(size.width * (originalSize.width / originalSize.height), size.height);
			}
			rect.origin.x = ((size.width - rect.size.width) / 2.0);
			rect.origin.y = ((size.height - rect.size.height) / 2.0);
			break;
			
		default :
			[NSException raise:NSInternalInconsistencyException format:@"Invalid image resize mode"];
			break;
	}
	
	size.width = floorf(size.width);
	size.height = floorf(size.height);
	
	CGImageRef cgImage = self.CGImage;
	CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(cgImage);
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef ctx = CGBitmapContextCreate(nil,
											 size.width,
											 size.height,
											 8,
											 size.width * 4,
											 colorSpace,
											 bitmapInfo);
	CGColorSpaceRelease(colorSpace);
    CGContextConcatCTM(ctx, CGAffineTransformMake(1, 0, 0, -1, 0, size.height));
	CGContextClearRect(ctx, CGRectMake(0, 0, size.width, size.height));
	CGContextSetInterpolationQuality(ctx, kCGInterpolationHigh);
	CGContextDrawImage(ctx, rect, cgImage);
	CGImageRef resizedCGImage = CGBitmapContextCreateImage(ctx);
	CGContextRelease(ctx);
	UIImage *resizedImage = [UIImage imageWithCGImage:resizedCGImage scale:scale orientation:imageOrientation];
	CGImageRelease(resizedCGImage);
	
	return resizedImage;
}

@end
