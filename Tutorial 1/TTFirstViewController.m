//
//  TTFirstViewController.m
//  Tutorial 1
//
//  Created by Weston Hanners on 3/25/14.
//  Copyright (c) 2014 Hanners Software. All rights reserved.
//

#import "TTFirstViewController.h"

@interface TTFirstViewController ()

@property (readonly) UILabel *helloLabel, *goodbyeLabel;
@property (readonly) UIButton *clickMe;

@end

@implementation TTFirstViewController

@synthesize helloLabel = _helloLabel, goodbyeLabel = _goodbyeLabel, clickMe = _clickMe;

- (id)init {
    if (self = [super init]) {
        [self.view setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.helloLabel];
    [self.view addSubview:self.goodbyeLabel];
    [self.view addSubview:self.clickMe];
    
    NSDictionary *elementsDict = NSDictionaryOfVariableBindings(_helloLabel, _goodbyeLabel, _clickMe);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_helloLabel]-[_goodbyeLabel]-[_clickMe]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_helloLabel]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_goodbyeLabel]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_clickMe]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementsDict]];
    
}


- (void)clickedMe:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test" message:@"test" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    
    [alert show];
}

#pragma mark - UI Elements

- (UILabel *)helloLabel {
    if (!_helloLabel) {
        _helloLabel = [UILabel new];
        [_helloLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_helloLabel setBackgroundColor:[UIColor blueColor]];
        [_helloLabel setText:@"Hello"];
    }
    return _helloLabel;
}

- (UILabel *)goodbyeLabel {
    if (!_goodbyeLabel) {
        _goodbyeLabel = [UILabel new];
        [_goodbyeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_goodbyeLabel setBackgroundColor:[UIColor greenColor]];
        [_goodbyeLabel setText:@"Goodbye"];
    }
    return _goodbyeLabel;
}

- (UIButton *)clickMe {
    if (!_clickMe) {
        _clickMe = [UIButton new];
        [_clickMe setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_clickMe setTitle:@"Click Me" forState:UIControlStateNormal];
        [_clickMe addTarget:self action:@selector(clickedMe:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickMe;
}

@end
