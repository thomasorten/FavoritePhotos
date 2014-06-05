//
//  FavoritesViewController.m
//  FavoritePhotos
//
//  Created by Thomas Orten on 6/2/14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import "FavoritesViewController.h"
#import "myCell.h"

@interface FavoritesViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITabBarControllerDelegate, UITabBarDelegate, UISearchBarDelegate>
@property NSMutableArray *favoritesArray;
@property (weak, nonatomic) IBOutlet UICollectionView *myFavoritesCollectionView;
@end

@implementation FavoritesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)load
{
    NSURL *imagelist = [[self documentsDirectory] URLByAppendingPathComponent:@"images.plist"];
    self.favoritesArray = [NSMutableArray arrayWithContentsOfURL:imagelist];
    if (!self.favoritesArray)
    {
        self.favoritesArray = [NSMutableArray array];
    }
}

- (NSURL *)documentsDirectory
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.favoritesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    myCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyFavoritesCell" forIndexPath:indexPath];
    NSURL *url = [NSURL URLWithString:[self.favoritesArray objectAtIndex:indexPath.row]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        cell.selectedImageView.image = [UIImage imageWithData:data];
    }];
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self load];
    [self.myFavoritesCollectionView reloadData];
}

@end
