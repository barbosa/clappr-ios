#import <UIKit/UIKit.h>

#import "CLPSpinnerThreeBouncePlugin.h"
#import "CLPContainer.h"

@interface CLPSpinnerThreeBouncePlugin ()
{
    UILabel *loadingLabel;
}
@end

@implementation CLPSpinnerThreeBouncePlugin

- (instancetype)init
{
    self = [super init];
    if (self) {
        loadingLabel = [UILabel new];
        loadingLabel.text = @"loading...";
        loadingLabel.textColor = [UIColor whiteColor];
        loadingLabel.backgroundColor = [UIColor blueColor];
        loadingLabel.layer.cornerRadius = 3.0;
        loadingLabel.layer.masksToBounds = NO;
        [loadingLabel sizeToFit];
        loadingLabel.hidden = YES;
    }
    return self;
}

- (UIView *)view
{
    return loadingLabel;
}

- (void)wasInstalled
{
    [super wasInstalled];

    [self bindEventListeners];

    loadingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.container addConstraint:[NSLayoutConstraint constraintWithItem:loadingLabel
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.container
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                                constant:0.0]];

    [self.container addConstraint:[NSLayoutConstraint constraintWithItem:loadingLabel
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.container
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0
                                                                constant:0.0]];
}

- (void)bindEventListeners
{
    __weak typeof(loadingLabel) weakLabel = loadingLabel;
    [self listenTo:self.container eventName:CLPContainerEventPause callback:^(NSDictionary *userInfo) {
//        weakLabel.hidden = NO;
    }];

    [self listenTo:self.container eventName:CLPContainerEventPlay callback:^(NSDictionary *userInfo) {
//        weakLabel.hidden = YES;
    }];
}

@end