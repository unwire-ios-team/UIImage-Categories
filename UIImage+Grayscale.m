//
//  UIImage+Grayscale.m
//  UIImageAdditions
//
//  Created by Manuel Meyer on 28.12.13.
//  Copyright (c) 2013 bit.fritze. All rights reserved.
//

#import "UIImage+Grayscale.h"

@implementation UIImage (Grayscale)

- (UIImage *)grayscaledImage
{
    UIImage *image = [self copy];
    float scaleFactor = [[UIScreen mainScreen] scale];
    
    CGRect imageRect = CGRectMake(0, 0, image.size.width * scaleFactor, image.size.height *scaleFactor);
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, scaleFactor);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 image.size.width * scaleFactor,
                                                 image.size.height * scaleFactor,
                                                 8,
                                                 0,//image.size.width * scaleFactor * 4,
                                                 colorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNone);
    CGContextSaveGState(context);
    
    CGContextDrawImage(context, imageRect, [image CGImage]);

    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    image = [UIImage imageWithCGImage:imageRef scale:scaleFactor orientation:0];
    
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();

    return image;
}
@end
