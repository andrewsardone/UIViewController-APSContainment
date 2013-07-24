#import <UIKit/UIKit.h>

@interface UIViewController (APSContainment)

- (void)aps_addChildViewController:(UIViewController *)childViewController;

- (void)aps_addChildViewController:(UIViewController *)childViewController
                         superview:(UIView *)superview;

- (void)aps_removeChildViewController:(UIViewController *)childViewController;

@end
