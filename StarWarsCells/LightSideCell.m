//
//  LightSideCell.m
//  StarWarsCells
//
//  Created by Nick Perkins on 5/4/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "LightSideCell.h"

@implementation LightSideCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor blueColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
