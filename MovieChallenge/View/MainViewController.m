//
//  MainViewController.m
//  MovieChallenge
//
//  Created by carl on 4/7/22.
//

#import "MainViewController.h"
#import "Network.h"
#import "MovieCell.h"
#import "DetailViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) NSArray *movieEntries;
@property (nonatomic, strong) NSDictionary *selectedMovie;

@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.movieTableView.delegate = self;
    self.movieTableView.dataSource = self;
    [self setProperWidths];

    self.navigationItem.title = @"Star Wars Movies";
    [self.navigationController.navigationBar setTitleTextAttributes:
       @{NSForegroundColorAttributeName:[UIColor redColor]}];


    NSString *films = @"https://swapi.dev/api/films/";
    [Network dataFromURLString:(NSString *)films completion:^(NSDictionary * _Nullable info, NSError * _Nullable error) {
        if (info != nil) {
            self.movieEntries = info[@"results"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.movieTableView reloadData];
            });
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showAlert:@"Data Not Available"];
            });
        }
    }];
}


- (void)showAlert:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                   message:message
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)setProperWidths {
    self.movieTableView.frame = CGRectMake(self.movieTableView.frame.origin.x,
                                           self.movieTableView.frame.origin.y,
                                           self.view.frame.size.width,
                                           self.movieTableView.frame.size.height);
    self.imageView.frame = self.view.frame;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.movieEntries.count;
}


#pragma mark - delegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"movieCell";

    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MovieCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...
    NSDictionary *movie = self.movieEntries[indexPath.row];
    cell.titleLabel.text = movie[@"title"];
    cell.releaseLabel.text = movie[@"release_date"];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedMovie = self.movieEntries[indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [segue.identifier isEqualToString:@"showDetail"] ) {
        DetailViewController *vc = segue.destinationViewController;
        vc.selectedMovie = self.selectedMovie;
    }
}



@end
