# NetworkActivityIndicator

[![Version](https://img.shields.io/cocoapods/v/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)

> A network activity indicator appears in the status bar and shows that network activity is occurring.
>The network activity indicator:
>
> - Spins in the status bar while network activity proceeds and disappears when network activity stops
> - Doesn’t allow user interaction
>
> Display the network activity indicator to provide feedback when your app accesses the network for more than a couple of seconds. If the operation finishes sooner than that, you don’t have to show the network activity indicator, because the indicator is likely to disappear before users notice its presence.
>
>— [iOS Human Interface Guidelines](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/Controls.html)

## Usage

Adding an activity to the network activity indicator manager is fairly simple:

### Displaying networ activity indicator

```swift
NetworkActivityIndicator.sharedIndicator.visible = true
```

### Hiding network activity indicator

```swift
NetworkActivityIndicator.sharedIndicator.visible = false
```

### Balancing network activity indicator

```swift
NetworkActivityIndicator.sharedIndicator.visible = true
NetworkActivityIndicator.sharedIndicator.visible = true
NetworkActivityIndicator.sharedIndicator.visible = true
// Activities count = 3

NetworkActivityIndicator.sharedIndicator.visible = false
// Network activity indicator still showing, activities count = 2

NetworkActivityIndicator.sharedIndicator.visible = false
NetworkActivityIndicator.sharedIndicator.visible = false
// Network activity indicator hides, activities count = 0

```


## Installation

**NetworkActivityIndicator** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NetworkActivityIndicator'
```

## License

**NetworkActivityIndicator** is available under the MIT license. See the LICENSE file for more info.

## Author

Elvis Nuñez, [@3lvis](https://twitter.com/3lvis)
