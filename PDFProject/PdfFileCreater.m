//
//  PdfFileCreater.m
//  PDFProject
//
//  Created by Macpro033 on 23/02/15.
//  Copyright (c) 2015 Macpro033. All rights reserved.
//

#import "PdfFileCreater.h"
@interface PdfFileCreater ()
{
    CGSize _pageSize;
    
    float secondLineOrigin;
}
@end

@implementation PdfFileCreater
- (void)setupPDFDocumentNamed:(NSString*)name withData:(PDFFileObject*)pdfFileObject;{
    
    NSString *newPDFName = [NSString stringWithFormat:@"%@.pdf", name];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *pdfPath = [documentsDirectory stringByAppendingPathComponent:newPDFName];
    
    NSLog(@"Path: %@",pdfPath);
    //exp
    
    NSString *pdfFileName =pdfPath;
    // Create the PDF context using the default page size of 612 x 792.
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    
    //CFRange currentRange = CFRangeMake(0, 15);
    NSInteger currentPage = 0;
    // BOOL done = NO;
    //test
    _pageSize=CGSizeMake(kWidgh, kHieght);
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, kWidgh, kHieght), nil);
    [self drawPageNumber:currentPage];
    
    UIImage *anImage = [UIImage imageNamed:@"ebay_image.png"];
    CGRect imageRect = [self addImage:anImage
                              atPoint:CGPointMake(20, 35)];

    NSString *displayStr=[NSString stringWithFormat:@"Contact us: %@ || %@",pdfFileObject.strContactUs,pdfFileObject.strEmailId];
    
    CGRect textRect = [self addText:displayStr withFrame:CGRectMake(CGRectGetMaxX(imageRect)+5, 35, 320, 20) fontSize:9.0f fontType:nil];
    
    
    displayStr=@"WS Retail Service Pvt. Ltd.,";
    
    textRect=[self addText:displayStr withFrame:CGRectMake(CGRectGetMaxX(imageRect)+5, textRect.origin.y+textRect.size.height,300, 20) fontSize:15.0f fontType:nil];
    
    
    displayStr=@"warehouse address: Khasta No.# 04,Lal Dora Ext. Mohipalpur, Delhi, Dehli, India -110037";
    
    textRect=[self addText:displayStr withFrame:CGRectMake(CGRectGetMaxX(imageRect)+5,textRect.origin.y+textRect.size.height, 300, 20) fontSize:7.0f fontType:nil];
    
    
    displayStr=@"Order Type :";
    [self addText:displayStr withFrame:CGRectMake(370, 35, 80, 30) fontSize:12.0f fontType:BOLDFONT];
    
    displayStr=pdfFileObject.strInvoiceNo;
    [self addText:displayStr withFrame:CGRectMake(450, 35, 190, 30) fontSize:12.0f fontType:nil];
    
    CGRect lineRect=[self addLineWithFrame:CGRectMake(kPadding, textRect.origin.y + textRect.size.height + kPadding, kWidgh-(kPadding*2), 1)
                                 withColor:[UIColor blackColor]];
    
    displayStr=@"Order ID:";//[NSString stringWithFormat:@"Order ID: %@",pdfFileObject.strOrderId];
    textRect=[self addText:displayStr withFrame:CGRectMake(kPadding, lineRect.origin.y+lineRect.size.height+3, 80, 20) fontSize:10.0f fontType:BOLDFONT];
    
    displayStr=pdfFileObject.strOrderId;
    textRect=[self addText:displayStr withFrame:CGRectMake(textRect.origin.x+textRect.size.width+1, textRect.origin.y, 120, 20) fontSize:10.0f fontType:BOLDFONT];
    
    displayStr=@"Order Date:";
    CGRect firstLineRect=[self addText:displayStr withFrame:CGRectMake(kPadding, textRect.origin.y+textRect.size.height+5, 80, 20) fontSize:10.0f fontType:BOLDFONT];
    
    displayStr=pdfFileObject.strOrderDate;
    firstLineRect=[self addText:displayStr withFrame:CGRectMake(firstLineRect.origin.x+firstLineRect.size.width+1, firstLineRect.origin.y, 120, 20) fontSize:10.0f fontType:nil];
    
    displayStr=@"Invoice Date:";
    firstLineRect=[self addText:displayStr withFrame:CGRectMake(kPadding, firstLineRect.origin.y+firstLineRect.size.height+5, 80, 20) fontSize:10.0f fontType:BOLDFONT];
    
    displayStr=pdfFileObject.strInvoiceDate;
    firstLineRect=[self addText:displayStr withFrame:CGRectMake(firstLineRect.origin.x+firstLineRect.size.width+1, firstLineRect.origin.y, 120, 20) fontSize:10.0f fontType:nil];
    
    
    displayStr=@"VAT/TIN:";
    firstLineRect=[self addText:displayStr withFrame:CGRectMake(kPadding, firstLineRect.origin.y+firstLineRect.size.height+5, 80, 20) fontSize:10.0f fontType:BOLDFONT];
    
    
    displayStr=(pdfFileObject.strVatTin)?pdfFileObject.strVatTin:@"NA";
    firstLineRect=[self addText:displayStr withFrame:CGRectMake(firstLineRect.origin.x+firstLineRect.size.width+1, firstLineRect.origin.y, 120, 20) fontSize:10.0f fontType:nil];
    
    
    displayStr=@"Service tax #:";
    firstLineRect=[self addText:displayStr withFrame:CGRectMake(kPadding, firstLineRect.origin.y+firstLineRect.size.height+5, 80, 20) fontSize:10.0f fontType:BOLDFONT];
    secondLineOrigin=firstLineRect.origin.y+firstLineRect.size.height;
    
    displayStr=(pdfFileObject.strServiceTax)?pdfFileObject.strServiceTax:@"NA";
    firstLineRect=[self addText:displayStr withFrame:CGRectMake(firstLineRect.origin.x+firstLineRect.size.width+1, firstLineRect.origin.y, 120, 20) fontSize:10.0f fontType:nil];
    
    
    
    
    //Second Column
    displayStr=@"Billing Address";
    CGRect secondLineRect=[self addText:displayStr withFrame:CGRectMake(280,  lineRect.origin.y+lineRect.size.height+3, 80, 20) fontSize:10.0f fontType:BOLDFONT];
    
    displayStr=pdfFileObject.strName;
    secondLineRect=[self addText:displayStr withFrame:CGRectMake(secondLineRect.origin.x, secondLineRect.origin.y+secondLineRect.size.height+5, 120, 30) fontSize:10.0f fontType:nil];
    
    displayStr=pdfFileObject.strBillingAddrs;
    
    secondLineRect=[self addText:displayStr withFrame:CGRectMake(secondLineRect.origin.x, secondLineRect.origin.y+secondLineRect.size.height+5, 120, 400) fontSize:10.0f fontType:nil];
    
    if (secondLineOrigin<(secondLineRect.origin.y+secondLineRect.size.height+10)) {
        secondLineOrigin=secondLineRect.size.height+secondLineRect.origin.y+10;
    }
    
    displayStr=@"Shipping Address";
    CGRect thirdLineRect=[self addText:displayStr withFrame:CGRectMake(secondLineRect.origin.x+secondLineRect.size.width+10, lineRect.origin.y+lineRect.size.height+3, 120, 20) fontSize:10.0f fontType:BOLDFONT];
    
    displayStr=pdfFileObject.strName;
    thirdLineRect=[self addText:displayStr withFrame:CGRectMake(thirdLineRect.origin.x, thirdLineRect.origin.y+thirdLineRect.size.height+5, 120, 30) fontSize:10.0f fontType:nil];
    
    displayStr=pdfFileObject.strShippingAddrs;
    
    thirdLineRect=[self addText:displayStr withFrame:CGRectMake(thirdLineRect.origin.x, thirdLineRect.origin.y+thirdLineRect.size.height+5, 120, 400) fontSize:10.0f fontType:nil];
    
    
    if (secondLineOrigin<(thirdLineRect.origin.y+thirdLineRect.size.height+10)) {
        secondLineOrigin=thirdLineRect.origin.y+thirdLineRect.size.height+10;
    }
    
    CGRect lineRect2=[self addLineWithFrame:CGRectMake(kPadding, secondLineOrigin, kWidgh-(kPadding*2), 1) withColor:[UIColor blackColor]];
    
    
    displayStr=@"Product";
    CGRect productColumnRect=[self addText:displayStr withFrame:CGRectMake(lineRect2.origin.x+3, lineRect2.origin.y+5, 80, 20) fontSize:10.0 fontType:BOLDFONT];
    
    CGRect lineRect3=[self addLineWithFrame:CGRectMake(kPadding, productColumnRect.origin.y+productColumnRect.size.height+5, kWidgh-(kPadding*2), 1) withColor:[UIColor blackColor]];
    
    displayStr=pdfFileObject.strProductName;
    
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect3.origin.y+10, 80, 20) fontSize:10.0f fontType:nil];
    
    
    displayStr=@"Title";
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x+productColumnRect.size.width+10, lineRect2.origin.y+5, 80, 20) fontSize:10.0 fontType:BOLDFONT];
    
    displayStr=pdfFileObject.strProductTitle;
    
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect3.origin.y+10, 80, 20) fontSize:10.0f fontType:nil];
    
    
    CGRect lineRect4=[self addLineWithFrame:CGRectMake(kPadding, productColumnRect.origin.y+productColumnRect.size.height+5, kWidgh-(kPadding*2), 1) withColor:[UIColor blackColor]];
    
    
    
    float qtyPoint,pricePoint,taxPoint,totalPoint;
    displayStr=@"Qty";
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x+productColumnRect.size.width+10, lineRect2.origin.y+5, 80, 20) fontSize:10.0 fontType:BOLDFONT];
    qtyPoint=productColumnRect.origin.x;
    
    
    displayStr=pdfFileObject.strQty;
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect3.origin.y+10, 60, 20) fontSize:10.0f fontType:nil];
    
    displayStr=@"Total";
    CGRect totalColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x-40,lineRect4.origin.y+10, 60, 20) fontSize:10.0f fontType:BOLDFONT];
    
    displayStr=pdfFileObject.strQty;
    totalColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect4.origin.y+10, 60, 20) fontSize:10.0f fontType:BOLDFONT];
    
    
    displayStr=@"Price";
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x+productColumnRect.size.width+10, lineRect2.origin.y+5, 80, 20) fontSize:10.0 fontType:BOLDFONT];
    pricePoint=productColumnRect.origin.x;
    displayStr=pdfFileObject.strPrice;
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect3.origin.y+10, 80, 20) fontSize:10.0f fontType:nil];
    totalColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect4.origin.y+10, 60, 20) fontSize:10.0f fontType:BOLDFONT];
    
    
    displayStr=@"Tax";
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x+productColumnRect.size.width+10, lineRect2.origin.y+5, 80, 20) fontSize:10.0 fontType:BOLDFONT];
    taxPoint=productColumnRect.origin.x;
    
    
    displayStr=pdfFileObject.strTax;
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect3.origin.y+10, 80, 20) fontSize:10.0f fontType:nil];
    totalColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect4.origin.y+10, 60, 20) fontSize:10.0f fontType:BOLDFONT];
    
    displayStr=@"Total";
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x+productColumnRect.size.width+10, lineRect2.origin.y+5, 80, 20) fontSize:10.0 fontType:BOLDFONT];
    totalPoint=productColumnRect.origin.x;
    
    displayStr=pdfFileObject.strTotal;
    productColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect3.origin.y+10, 80, 20) fontSize:10.0f fontType:nil];
    totalColumnRect=[self addText:displayStr withFrame:CGRectMake(productColumnRect.origin.x,lineRect4.origin.y+10, 60, 20) fontSize:10.0f fontType:BOLDFONT];
    
    
    
    
    CGRect lineRect5=[self addLineWithFrame:CGRectMake(kPadding, totalColumnRect.origin.y+totalColumnRect.size.height+5, kWidgh-(kPadding*2), 1) withColor:[UIColor blackColor]];
    
    
    displayStr=[NSString stringWithFormat:@"Grand Total     Rs%@ /-",pdfFileObject.strTotal];
    
    
    totalColumnRect=[self addText:displayStr withFrame:CGRectMake(340, lineRect5.origin.y+5, 255, 20) fontSize:15.0 fontType:BOLDFONT];
    
    
    CGRect lineRect6=[self addLineWithFrame:CGRectMake(kPadding, totalColumnRect.origin.y+totalColumnRect.size.height+5, kWidgh-(kPadding*2), 1) withColor:[UIColor blackColor]];
    
    
    displayStr=[NSString stringWithFormat:@"Balace Amount:  Rs%@ /-",pdfFileObject.strBalanceAmount];
    
    totalColumnRect=[self addText:displayStr withFrame:CGRectMake(totalColumnRect.origin.x, lineRect6.origin.y+lineRect6.size.height+5, 255, 20) fontSize:10.0f fontType:nil];
    
              // Grand Total     Rs%@ /-
    displayStr=[NSString stringWithFormat:@"Paid Amount:    Rs%@ /-",pdfFileObject.strPaidAmount];
    totalColumnRect=[self addText:displayStr withFrame:CGRectMake(totalColumnRect.origin.x, totalColumnRect.origin.y+totalColumnRect.size.height+5, totalColumnRect.size.width, totalColumnRect.size.height) fontSize:10.0f fontType:nil];
    
    CGRect lineRect7=[self addLineWithFrame:CGRectMake(kPadding, totalColumnRect.origin.y+totalColumnRect.size.height+5, kWidgh-(kPadding*2), 1) withColor:[UIColor blackColor]];
    
    
    displayStr=@"This is system generated invoice, Hance signature is not required.";
    
    [self addText:displayStr withFrame:CGRectMake(125,lineRect7.origin.y+lineRect7.size.height+5,  kWidgh, 20) fontSize:10.0f fontType:nil];
    
    
    //CGRect lineRect4=[self addLineWithFrame:CGRectMake(kPadding+100, productColumnRect.origin.y+productColumnRect.size.height+5, kWidgh-(kPadding*2)-100, 1) withColor:[UIColor blackColor]];

    
    
    //[self addLineWithFrame:CGRectMake(lineRect2.origin.x+3, lineRect2.origin.y+5, 80, 20) withColor:<#(UIColor *)#>]
    
    
    UIGraphicsEndPDFContext();
    
    
       
    
}

// Use Core Text to draw the text in a frame on the page.
- (CFRange)renderPage:(NSInteger)pageNum withTextRange:(CFRange)currentRange
       andFramesetter:(CTFramesetterRef)framesetter
{
    // Get the graphics context.
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    // Create a path object to enclose the text. Use 72 point
    // margins all around the text.
    CGRect    frameRect = CGRectMake(72, 72, 468, 648);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    
    // Get the frame that will do the rendering.
    // The currentRange variable specifies only the starting point. The framesetter
    // lays out as much text as will fit into the frame.
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);
    
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 792);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
    
    // Update the current range based on what was drawn.
    currentRange = CTFrameGetVisibleStringRange(frameRef);
    currentRange.location += currentRange.length;
    currentRange.length = 0;
    CFRelease(frameRef);
    
    return currentRange;
}

- (void)drawPageNumber:(NSInteger)pageNum
{
    NSString *pageString = [NSString stringWithFormat:@"Page %d", pageNum];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    CGSize maxSize = CGSizeMake(612, 72);
    
    CGSize pageStringSize = [pageString sizeWithFont:theFont
                                   constrainedToSize:maxSize
                                       lineBreakMode:NSLineBreakByClipping];
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.width) / 2.0),
                                   720.0 + ((72.0 - pageStringSize.height) / 2.0),
                                   pageStringSize.width,
                                   pageStringSize.height);
    
    [pageString drawInRect:stringRect withFont:theFont];
}


















- (void)beginPDFPage {
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, _pageSize.width, _pageSize.height), nil);
}
- (CGRect)addText:(NSString*)text withFrame:(CGRect)frame fontSize:(float)fontSize fontType:(NSString *)type{
    UIFont *font;
    //    NSLog(@"Frame: %@",frame);
    if([type isEqualToString:@"Helvetica-Bold"])
    {
        font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];//[UIFont systemFontOfSize:fontSize];
    }
    else
    {
        font = [UIFont systemFontOfSize:fontSize];
    }
    
    //    CGSize stringSize = [text sizeWithFont:font constrainedToSize:CGSizeMake(_pageSize.width - 2*20-2*20, _pageSize.height - 2*20 - 2*20) lineBreakMode:NSLineBreakByWordWrapping];
    CGSize stringSize = [text sizeWithFont:font constrainedToSize:CGSizeMake(frame.size.width, _pageSize.height - 2*20 - 2*20) lineBreakMode:NSLineBreakByWordWrapping];
    
    
    float textWidth = frame.size.width;
    
    if (textWidth < stringSize.width)
        textWidth = stringSize.width;
    if (textWidth > _pageSize.width)
        textWidth = _pageSize.width - frame.origin.x;
    CGRect renderingRect = CGRectMake(frame.origin.x, frame.origin.y, textWidth, stringSize.height);
    
    //    [text drawInRect:renderingRect withAttributes:nil];
    
    [text drawInRect:renderingRect
            withFont:font
       lineBreakMode:NSLineBreakByWordWrapping
           alignment:NSTextAlignmentLeft];
    
    
    //    frame = CGRectMake(frame.origin.x, frame.origin.y, textWidth, stringSize.height);
    frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, stringSize.height);
    return frame;
    
}

-   (CGRect)addLineWithFrame:(CGRect)frame withColor:(UIColor*)color {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(currentContext, color.CGColor);
    // this is the thickness of the line
    CGContextSetLineWidth(currentContext, frame.size.height);
    
    CGPoint startPoint = frame.origin;
    CGPoint endPoint = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y);
    CGContextBeginPath(currentContext);
    CGContextMoveToPoint(currentContext, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(currentContext, endPoint.x, endPoint.y);
    
    CGContextClosePath(currentContext);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    return frame;
    
}

- (CGRect)addImage:(UIImage*)image atPoint:(CGPoint)point {
    CGRect imageFrame = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    [image drawInRect:imageFrame];
    return imageFrame;
}

- (void)finishPDF {
    UIGraphicsEndPDFContext();
}
//- (IBAction)didClickReadPdf:(id)sender {
//    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *pdfPath = [documentsDirectory stringByAppendingPathComponent:@"NewPDF.pdf"];
//    NSLog(@"%@",pdfPath);
//    if([[NSFileManager defaultManager] fileExistsAtPath:pdfPath]) {
//        
//        ReaderDocument *document = [ReaderDocument withDocumentFilePath:pdfPath password:nil];
//        
//        if (document != nil)
//        {
//            readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
//            readerViewController.delegate = self;
//            
//            readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//            readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
//            
//            //            [self presentModalViewController:readerViewController animated:YES];
//            [self presentViewController:readerViewController animated:YES completion:nil];
//        }
//    }
//}
//- (IBAction)didClickCreatePdf:(id)sender {
//    [self setupPDFDocumentNamed:@"NewPDF" Width:850 Height:1100];
//    
//    
//}

@end
