# NetworkActivityIndicator

[![Version](https://img.shields.io/cocoapods/v/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)

## Introduction

> A network activity indicator appears in the status bar and shows that network activity is occurring.
>The network activity indicator:
>
> - Spins in the status bar while network activity proceeds and disappears when network activity stops
> - Doesn’t allow user interaction
>
> Display the network activity indicator to provide feedback when your app accesses the network for more than a couple of seconds. If the operation finishes sooner than that, you don’t have to show the network activity indicator, because the indicator is likely to disappear before users notice its presence.
>
>— [iOS Human Interface Guidelines](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/Controls.html)

## The problem

A great introduction to what's wrong with Apple's `networkActivityIndicatorVisible:` API:

>iPhone developers should use the little network activity indicator in the iPhone’s status bar to inform the user when their app accesses the network. Showing or hiding the indicator is simple:
>
>`UIApplication.sharedApplication().networkActivityIndicatorVisible = true`
>
>Most people probably call this method from their view controllers. This works fine until you have to deal with multiple concurrent tasks that access the network and/or multiple view controllers that are active simultaneously. For example, you might be running a HTTP request to download data from a webservice in the background and using a `MKMapView` instance that accesses the network whenever the user moves the map to a new location.
>
>If you access the `networkActivityIndicatorVisible` property directly from multiple methods in these cases, chances are that you hide the indicator when the first task has finished even though your app continues to access the network. You would need to implement a counter to remember how often the network activity indicator has been shown and hidden to manage it correctly. If your code is spread among multiple view controllers, this gets even more cumbersome.
>
>This “problem” is admittedly a small aspect of usability but the solution is so simple and elegant that I think it is worth doing even if you do not deal with multiple concurrent network activity tasks in your app.
>
>— [Ole Begemann, Managing the Network Activity Indicator](http://oleb.net/blog/2009/09/managing-the-network-activity-indicator/)

## Usage

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
// Network activity indicator starts showing, activity count = 1

NetworkActivityIndicator.sharedIndicator.visible = true
NetworkActivityIndicator.sharedIndicator.visible = true
// Activity count = 3

NetworkActivityIndicator.sharedIndicator.visible = false
// Network activity indicator still showing, activity count = 2

NetworkActivityIndicator.sharedIndicator.visible = false
NetworkActivityIndicator.sharedIndicator.visible = false
// Network activity indicator hides, activity count = 0

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
