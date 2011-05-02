//
//  MyTravelCellView.m
//  iTravel
//
//  Created by jeremy on 4/30/11.
//  Copyright 2011 org.doubleking. All rights reserved.
//

#import "MyTravelCellView.h"
#import "ResourceLoader.h"

@implementation MyTravelCellView
@synthesize lblDate;
@synthesize lblFrom;
@synthesize lblFromPlace;
@synthesize lblTo;
@synthesize lblToPlace;
@synthesize imgArrow;

-(void)styledLabel:(UILabel *)_label WithFont:(UIFont *)_font{
    _label.font = _font;
    _label.backgroundColor = [UIColor clearColor];
    _label.textColor = [UIColor whiteColor];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIFont *byxs7000Font = [ResourceLoader loadFontFromFile:@"Fonts/hakuyoxingshu7000.ttf" withFontFamilyName:@"hakuyoxingshu7000" withFontSize:24.0];
        [self styledLabel:self.lblDate WithFont:byxs7000Font];
        [self styledLabel:self.lblFrom WithFont:byxs7000Font];
        [self styledLabel:self.lblFromPlace WithFont:byxs7000Font];
        [self styledLabel:self.lblTo WithFont:byxs7000Font];
        [self styledLabel:self.lblToPlace WithFont:byxs7000Font];
    }
    return self;
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [(MyTravelCellView *)[[nibBundleOrNil loadNibNamed:nibNameOrNil owner:self options:nil] objectAtIndex:0] retain];
    if(self){
        UIFont *byxs7000Font = [ResourceLoader loadFontFromFile:@"Fonts/hakuyoxingshu7000.ttf" withFontFamilyName:@"hakuyoxingshu7000" withFontSize:24.0];
        [self styledLabel:self.lblDate WithFont:byxs7000Font];
        [self styledLabel:self.lblFrom WithFont:byxs7000Font];
        [self styledLabel:self.lblFromPlace WithFont:byxs7000Font];
        [self styledLabel:self.lblTo WithFont:byxs7000Font];
        [self styledLabel:self.lblToPlace WithFont:byxs7000Font];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [lblDate release];
    [lblFrom release];
    [lblFromPlace release];
    [lblTo release];
    [lblToPlace release];
    [imgArrow release];
    [super dealloc];
}

@end
