//
//  myCell.h
//  FavoritePhotos
//
//  Created by Thomas Orten on 6/2/14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *theImageView;
@property (weak, nonatomic) IBOutlet UIButton *checkMarkButton;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
@end
