//
//  UIImage+PathCropping.h
//  UIImageAdditions
//
//  Created by Manuel Meyer on 28.12.13.
//  Copyright (c) 2013 bit.fritze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PathCropping)
-(UIImage *)imageCroppedWithPath:(UIBezierPath *)path;
-(UIImage *)imageCroppedWithPath:(UIBezierPath *)path invertPath:(BOOL) invertPath;

@end
