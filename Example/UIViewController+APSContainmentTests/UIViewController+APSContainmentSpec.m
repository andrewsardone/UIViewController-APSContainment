#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <UIViewController+APSContainment/UIViewController+APSContainment.h>

SpecBegin(UIViewController_APSContainmentSpec)

describe(@"UIViewController+APSContainment", ^{

    __block UIViewController *parent;
    __block UIViewController *child;

    beforeEach(^{
        parent = [UIViewController new];
        child = [UIViewController new];
    });

    it(@"includes an interface for adding child view controller", ^{
        [parent aps_addChildViewController:child];

        expect(child.parentViewController).to.equal(parent);
    });

    it(@"handles required view hierarchy and containment events when adding child", ^{
        id mockParent = [OCMockObject partialMockForObject:parent];
        id mockParentView = [OCMockObject partialMockForObject:parent.view];
        id mockChild = [OCMockObject partialMockForObject:child];

        [[mockParent expect] addChildViewController:child];
        [[mockParentView expect] addSubview:child.view];
        [[mockChild expect] didMoveToParentViewController:parent];

        [parent aps_addChildViewController:child];

        [mockParent verify];
        [mockParentView verify];
        [mockChild verify];
    });

    it(@"can add a child view controller's view to any subview of the parent's view ", ^{
        UIView *parentSubview = [UIView new];
        [parent.view addSubview:parentSubview];

        [parent aps_addChildViewController:child superview:parentSubview];

        expect(child.view.superview).to.equal(parentSubview);
        expect(child.parentViewController).to.equal(parent);
    });

    it(@"defaults to the parent's root view if a nil superview is sent", ^{
        [parent aps_addChildViewController:child superview:nil];
        expect(child.view.superview).to.equal(parent.view);
    });

    context(@"child view controller removal", ^{

        beforeEach(^{
            [parent aps_addChildViewController:child];
        });

        it(@"includes an interface for removing a child view controller", ^{
            expect(child.parentViewController).to.equal(parent);
            [parent aps_removeChildViewController:child];
            expect(child.parentViewController).to.beNil();
        });

        it(@"removes the child view controller's view from its parent view's hierarchy", ^{
            [parent aps_removeChildViewController:child];
            expect(child.view.superview).to.beNil();
        });

        it(@"notifies the child it is moving to a nil parent", ^{
            id mockChild = [OCMockObject partialMockForObject:child];

            [[mockChild expect] willMoveToParentViewController:nil];

            [parent aps_removeChildViewController:child];

            [mockChild verify];
        });

    });

});

SpecEnd
