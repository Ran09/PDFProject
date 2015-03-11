//
//  PdfFileCreater.h
//  PDFProject
//
//  Created by Macpro033 on 23/02/15.
//  Copyright (c) 2015 Macpro033. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PDFFileObject.h"
#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>
#define kWidgh 595
#define kHieght 900
#define kPadding 10
#define BOLDFONT @"Helvetica-Bold"
@interface PdfFileCreater : NSObject
- (void)setupPDFDocumentNamed:(NSString*)name withData:(PDFFileObject*)pdfFileObject;
@end
