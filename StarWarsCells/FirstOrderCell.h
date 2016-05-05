//
//  FirstOrderCell.h
//  StarWarsCells
//
//  Created by Nick Perkins on 5/4/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstOrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageProfile;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end
