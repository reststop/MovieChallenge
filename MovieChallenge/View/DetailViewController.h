//
//  DetailViewController.h
//  MovieChallenge
//
//  Created by carl on 4/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *scrollButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *directedByLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;

@property (weak, nonatomic) IBOutlet UILabel *producedByLabel;
@property (weak, nonatomic) IBOutlet UILabel *producerLabel;

@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseLabel;

@property (weak, nonatomic) IBOutlet UITextView *scrollTextField;

@property (nonatomic, strong) NSDictionary *selectedMovie;


@end

NS_ASSUME_NONNULL_END
