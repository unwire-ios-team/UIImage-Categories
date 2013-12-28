//
//  UIImage+PathCropping.m
//  UIImageAdditions
//
//  Created by Manuel Meyer on 28.12.13.
//  Copyright (c) 2013 bit.fritze. All rights reserved.
//

#import "UIImage+PathCropping.h"
#import "UIImage+Resize.h"

@implementation UIImage (PathCropping)
-(UIImage *)imageCroppedWithPath:(UIBezierPath *)path
{
    
    return [self imageCroppedWithPath:path invertPath:NO];
}

-(UIImage *)imageCroppedWithPath:(UIBezierPath *)path
                      invertPath:(BOOL)invertPath
{
    
    
    UIImage *newImage = [self copy];
    
    UIGraphicsBeginImageContextWithOptions(newImage.size, NO, 0.0);
    
    CGColorSpaceRef colorSpace  = CGImageGetColorSpace(newImage.CGImage);
    CGContextRef context        = CGBitmapContextCreate(NULL,
                                                        newImage.size.width,
                                                        newImage.size.height,
                                                        CGImageGetBitsPerComponent(newImage.CGImage),
                                                        0,
                                                        colorSpace,
                                                        (CGBitmapInfo)CGImageGetAlphaInfo(newImage.CGImage)
                                                        );
    CGContextSaveGState(context);

    CGContextTranslateCTM(context, 0.0, newImage.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    if(invertPath){
        UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,
                                                                             0,
                                                                             newImage.size.width,
                                                                             newImage.size.height)];
        CGContextAddPath(context, rectPath.CGPath);
        CGContextAddPath(context, path.CGPath);
        CGContextEOClip(context);
    } else {
        CGContextAddPath(context, path.CGPath);
        CGContextClip(context);
    }
    CGContextScaleCTM(context, 1.0, -1.0);

    CGContextTranslateCTM(context, 0.0, -newImage.size.height);

    CGContextDrawImage(context, CGRectMake(0, 0, newImage.size.width, newImage.size.height), newImage.CGImage);
    CGContextRestoreGState(context);

    newImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
