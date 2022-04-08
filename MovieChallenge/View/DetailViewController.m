//
//  DetailViewController.m
//  MovieChallenge
//
//  Created by carl on 4/7/22.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    [self setProperWidths];
    self.titleLabel.text = self.selectedMovie[@"title"];
    self.directorLabel.text = self.selectedMovie[@"director"];
    self.producerLabel.text = self.selectedMovie[@"producer"];
    self.releaseLabel.text = self.selectedMovie[@"release_date"];
//    self.scrollTextField.text = self.selectedMovie[@"opening_crawl"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setTextField];
}


// this code was added especially to transform the textField into
// a scrollable view lik the original text in Star Wars.
- (void)setTextField {

    // Learn the basics of matrix transforms: http://markpospesel.wordpress.com/tag/catransform3d/

    UITextView *textView = [[UITextView alloc] initWithFrame:
                            CGRectInset(self.view.bounds, 32.0, 32.0)];
    [textView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [textView setBackgroundColor:[UIColor clearColor]];
    [textView setTextColor:[UIColor yellowColor]];
    [textView setEditable:NO];
    [textView setSelectable:NO];

    [textView setText:self.selectedMovie[@"opening_crawl"]];

    [textView setFont:[UIFont boldSystemFontOfSize:36.0]];
    [textView setTextAlignment:NSTextAlignmentCenter];

    // Start with a blank transform
    CATransform3D blankTransform = CATransform3DIdentity;

    // Skew the text
    blankTransform.m34 = -1.0 / 500.0;

    // Rotate the text
    blankTransform = CATransform3DRotate(blankTransform, 45.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);

    // Set the transform
    [textView.layer setTransform:blankTransform];

    [self.scrollView addSubview:textView];
}


- (void)setProperWidth:(UIView *)view {
    view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y,
                            self.view.frame.size.width, view.frame.size.height);
}

- (void)setProperWidths {
    [self setProperWidth:self.titleLabel];
    [self setProperWidth:self.directedByLabel];
    [self setProperWidth:self.directorLabel];
    [self setProperWidth:self.producedByLabel];
    [self setProperWidth:self.producerLabel];
    [self setProperWidth:self.releaseDateLabel];
    [self setProperWidth:self.releaseLabel];
    self.imageView.frame = self.view.frame;
}


@end
