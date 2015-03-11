//
//  ViewController.m
//  PDFProject
//
//  Created by Macpro033 on 19/02/15.
//  Copyright (c) 2015 Macpro033. All rights reserved.
//

#import "ViewController.h"
#import "PDFFileObject.h"
#import "PdfFileCreater.h"
#import "ReaderViewController.h"
#import "ReaderDocument.h"
//#import "pdf"


@interface ViewController ()
{
    CGSize _pageSize;
    ReaderViewController *readerViewController;
    
    PDFFileObject *pdfObject;
    
    float secondLineOrigin;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pdfObject=[[PDFFileObject alloc]init];
    pdfObject.strContactUs=@"1800 208 9898";
    pdfObject.strEmailId=@"cs@flipkart.com";
    pdfObject.strInvoiceNo =@"DEL2014110012152";
    pdfObject.strOrderId=@"OD00123755113334333";
    pdfObject.strOrderDate=@"09-11-2014";
    pdfObject.strInvoiceDate=@"09-11-2014";
//    pdfObject.strVatTin=@"78562558956";
//    pdfObject.strServiceTax=@"AAACW8325FSD001";
    pdfObject.strName=@"Monu Rathor";
    pdfObject.strBillingAddrs=@"Hunka Technologies S-2,Central Plaza, Baag Sevaniya,Bhopal(M.P.)INDIA,.\nBhopal 462023 Madhya Pradesh\n Phone No:74156895";
    pdfObject.strShippingAddrs=@"nHunka Technologies S-2,Central Plaza, Baag Sevaniya,Bhopal(M.P.)INDIA,.\nBhopal 462023 Madhya Pradesh\n Phone No:74156895 ";
    pdfObject.strProductName=@"image";
    pdfObject.strProductTitle=@"Angel Image";
    pdfObject.strQty=@"1";
    pdfObject.strPrice=@"50";
    pdfObject.strTax=@"5";
    pdfObject.strTotal=@"50";
    pdfObject.strBalanceAmount=@"50";
    pdfObject.strPaidAmount=@"50";
    pdfObject.imgPdfLogo=[UIImage imageNamed:@"ebay_image.png"];
    
    PdfFileCreater *pdfCreater=[[PdfFileCreater alloc]init];
    [pdfCreater setupPDFDocumentNamed:@"MyPdf" withData:pdfObject];
    

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didClickReadPdf:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pdfPath = [documentsDirectory stringByAppendingPathComponent:@"NewPDF.pdf"];
    NSLog(@"%@",pdfPath);
    if([[NSFileManager defaultManager] fileExistsAtPath:pdfPath]) {
        
        ReaderDocument *document = [ReaderDocument withDocumentFilePath:pdfPath password:nil];
        
        if (document != nil)
        {
            readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
            readerViewController.delegate = self;
            
            readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            
//            [self presentModalViewController:readerViewController animated:YES];
            [self presentViewController:readerViewController animated:YES completion:nil];
        }
    }
}
- (IBAction)didClickCreatePdf:(id)sender {
    PdfFileCreater *pdfCreater=[[PdfFileCreater alloc]init];
    [pdfCreater setupPDFDocumentNamed:@"MyPdf" withData:pdfObject];

   // [self setupPDFDocumentNamed:@"NewPDF" Width:850 Height:1100];
    
    

}

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
    NSLog(@"Pdf Close..");
//    [readerViewController removeFromParentViewController];
    [readerViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
