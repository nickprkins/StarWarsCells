//
//  CharacterTableViewController.m
//  StarWarsCells
//
//  Created by Nick Perkins on 5/4/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "CharacterTableViewController.h"
#import "Characters.h"
#import "ResistanceCell.h"
#import "FirstOrderCell.h"
#import "LightSideCell.h"
#import "DarkSideCell.h"

@interface CharacterTableViewController ()
@property NSMutableArray *characters;
-(void) loadCharacters;

@end

@implementation CharacterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"SWFA Characters";
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background-swfa.png"]];
    [tempImageView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = tempImageView;
    
    //Initialize Heroes Array
    self.characters = [[NSMutableArray alloc]init];
    
    [self loadCharacters];
}

-(void) loadCharacters{
    // This creates a string with the filepath to the heroes JSON file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"swfa" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *characters = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    NSSortDescriptor *firstDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:firstDescriptor, nil];
    NSArray *sortedArray = [characters sortedArrayUsingDescriptors:sortDescriptors];
    characters = [sortedArray copy];
    
    
    for (NSDictionary *characterDictionary in characters) {
        
        Characters * aCharacter = [Characters characterWithDictionary: characterDictionary];
        [self.characters addObject:aCharacter];
    }
    
    [[self tableView] reloadData];
    
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.characters.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
//{
//    return 80.; // you can have your own choice, of course
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 8.; // you can have your own choice, of course
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc] init];
//    headerView.backgroundColor = [UIColor clearColor];
//    return headerView;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Characters *aCharacter = self.characters[indexPath.row];
    UITableViewCell *cell;
    if ([aCharacter.characterType  isEqual: @"resistance"])
    {
        ResistanceCell *resistanceCell = (ResistanceCell *) [tableView dequeueReusableCellWithIdentifier:@"resistanceCell" forIndexPath:indexPath];
        resistanceCell.titleLabel.text = aCharacter.characterName;
        resistanceCell.detailLabel.text = aCharacter.characterDescription;
        resistanceCell.imageProfile.image = [UIImage imageNamed:aCharacter.characterImage];
        
        return resistanceCell;
    }
    else if ([aCharacter.characterType  isEqual: @"firstorder"])
    {
        FirstOrderCell *firstorderCell = (FirstOrderCell *) [tableView dequeueReusableCellWithIdentifier:@"firstorderCell" forIndexPath:indexPath];
        firstorderCell.titleLabel.text = aCharacter.characterName;
        firstorderCell.detailLabel.text = aCharacter.characterDescription;
        firstorderCell.imageProfile.image = [UIImage imageNamed:aCharacter.characterImage];
        
        return firstorderCell;
    }
    else if ([aCharacter.characterType  isEqual: @"lightside"])
    {
        LightSideCell *lightsideCell = (LightSideCell *) [tableView dequeueReusableCellWithIdentifier:@"lightsideCell" forIndexPath:indexPath];
        lightsideCell.titleLabel.text = aCharacter.characterName;
        lightsideCell.detailLabel.text = aCharacter.characterDescription;
        lightsideCell.imageProfile.image = [UIImage imageNamed:aCharacter.characterImage];
        
        return lightsideCell;
    }
    else if ([aCharacter.characterType  isEqual: @"darkside"])
    {
        DarkSideCell *darksideCell = (DarkSideCell *) [tableView dequeueReusableCellWithIdentifier:@"darksideCell" forIndexPath:indexPath];
        darksideCell.titleLabel.text = aCharacter.characterName;
        darksideCell.detailLabel.text = aCharacter.characterDescription;
        darksideCell.imageProfile.image = [UIImage imageNamed:aCharacter.characterImage];
        
        return darksideCell;
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"tableView" forIndexPath:indexPath];
    }
    cell.textLabel.text = aCharacter.characterName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", aCharacter.characterDescription];
    
    
    
    
//    cell.backgroundColor = [UIColor colorWithWhite:0.8 alpha:.3];
//    cell.textLabel.backgroundColor = [UIColor clearColor];
//    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
//    cell.detailTextLabel.textColor = [UIColor colorWithWhite:1.0 alpha:.3];
//    cell.layer.shadowOpacity = 1.0;
//    cell.layer.shadowRadius = 0.0;
//    cell.layer.shadowColor = [UIColor blackColor].CGColor;
//    cell.layer.shadowOffset = CGSizeMake(0.0, -1.0);
//    cell.textLabel.textColor = [UIColor colorWithWhite:1.0 alpha:.7];
//    cell.textLabel.highlightedTextColor = [UIColor darkGrayColor];
//    cell.detailTextLabel.highlightedTextColor = [UIColor darkGrayColor];
    
    // Configure the cell...
//    self.tableView.contentInset = UIEdgeInsetsMake(70, -5, 0, 0);
//    UIImageView *itemImageView = (UIImageView *)[cell imageView];
//    itemImageView.layer.cornerRadius = 40;
//    itemImageView.layer.borderWidth = 1.0f;
//    //itemImageView.layer.borderColor = [UIColor concreteColor].CGColor;
//    itemImageView.layer.masksToBounds = YES;
//    itemImageView.clipsToBounds = YES;
    
    
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
