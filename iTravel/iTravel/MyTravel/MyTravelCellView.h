//
//  MyTravelCellView.h
//  iTravel
//
//  Created by jeremy on 4/30/11.
//  Copyright 2011 org.doubleking. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTravelCellView : UITableViewCell {
    
    UILabel *lblDate;
    UILabel *lblFrom;
    UILabel *lblFromPlace;
    UILabel *lblTo;
    UILabel *lblToPlace;
    UIImageView *imgArrow;
}
@property (nonatomic, retain) IBOutlet UILabel *lblDate;
@property (nonatomic, retain) IBOutlet UILabel *lblFrom;
@property (nonatomic, retain) IBOutlet UILabel *lblFromPlace;
@property (nonatomic, retain) IBOutlet UILabel *lblTo;
@property (nonatomic, retain) IBOutlet UILabel *lblToPlace;
@property (nonatomic, retain) IBOutlet UIImageView *imgArrow;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end
