#import "UIViewController+APSContainment.h"

@implementation UIViewController (APSContainment)

- (void)aps_addChildViewController:(UIViewController *)childViewController
{
    [self aps_addChildViewController:childViewController superview:self.view];
}

- (void)aps_addChildViewController:(UIViewController *)childViewController
                         superview:(UIView *)superview
{
    if (superview == nil) superview = self.view;

    [self addChildViewController:childViewController];
    [superview addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)aps_removeChildViewController:(UIViewController *)childViewController
{
    [childViewController willMoveToParentViewController:nil];
    if (childViewController.isViewLoaded) {
        [childViewController.view removeFromSuperview];
    }
    [childViewController removeFromParentViewController];
}

@end
