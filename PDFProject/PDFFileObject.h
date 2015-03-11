//
//  PDFFileObject.h
//  PDFProject
//
//  Created by Macpro033 on 23/02/15.
//  Copyright (c) 2015 Macpro033. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PDFFileObject : NSObject
@property(nonatomic,retain) NSString *strOrderId,*strOrderDate,*strInvoiceDate,*strVatTin,*strServiceTax,*strBillingAddrs,*strShippingAddrs,*strTitle,*strContactUs,*strEmailId,*strInvoiceNo,*strName, *strProductName,*strProductTitle,*strQty,*strPrice,*strTax,*strTotal,*strBalanceAmount,*strPaidAmount;
@property UIImage *imgPdfLogo;

@end
