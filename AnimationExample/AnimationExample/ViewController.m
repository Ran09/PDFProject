//
//  ViewController.m
//  AnimationExample
//
//  Created by Macpro033 on 10/02/15.
//  Copyright (c) 2015 Macpro033. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//http://stackoverflow.com/questions/6040528/animation-using-array-of-images-in-sequence
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    NSArray *animationArray=[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"car"],
                             [UIImage imageNamed:@"car1"],
                             [UIImage imageNamed:@"car2"],
                             [UIImage imageNamed:@"car3"],
                             nil];
    UIImageView *animationView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320, 460)];
    animationView.backgroundColor=[UIColor purpleColor];
    animationView.animationImages=animationArray;
    animationView.animationDuration=1.5;
    animationView.animationRepeatCount=2;
    [animationView startAnimating];
    [self.view addSubview:animationView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
