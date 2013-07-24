# UIViewController-APSContainment

Added in iOS 5, the collection of UIViewController containment APIs made it nice to combine several view controllers to build a well structured and segmented user interface. The work involved in adding and removing child view controllers is [somewhat repetetive][srg], and what the frameworks do and don't take care of you is [easy to forget][cf].

[srg]: https://gist.github.com/andrewsardone/5854342
[cf]: http://confusatory.org/post/54049609435/notes-on-child-view-controllers

To make life easier, [Matt Drance][md] wrote a UIViewController category that handles the boilerplate view hierarhcy manipulation and container callback events:

[md]: https://github.com/drance

```objc
[parentVC aps_addChildViewController:childVC];

// vs.

[parentVC addChildViewController:childVC];
[parentVC.view addSubview:childVC.view];
[childVC didMoveToParentViewController:parentVC];
```

## Getting started

The original intention of this project was to package up Matt Drance's original gist into a CocoaPods-ready library. After I add some documentation, I'll get around to submitting it to the [specs repo][scp]. In the meantime, you add the following line to your `Podfile`:

```ruby
pod 'UIViewController+APSContainment', :git => 'https://github.com/andrewsardone/UIViewController-APSContainment.git'
```

To install manually, clone the repo and copy the files within `Classes/` into your Xcode project.

[scp]: https://github.com/CocoaPods/Specs

## Testing

To run the unit tests, bootstrap your environment and then test from either Xcode or the command line:

```
> script/bootstrap
> script/test
```
