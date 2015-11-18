# NetworkActivityIndicatorManager

[![Version](https://img.shields.io/cocoapods/v/NetworkActivityIndicatorManager.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicatorManager)
[![License](https://img.shields.io/cocoapods/l/NetworkActivityIndicatorManager.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicatorManager)
[![Platform](https://img.shields.io/cocoapods/p/NetworkActivityIndicatorManager.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicatorManager)

## Usage

Adding an activity to the network activity indicator manager is fairly simple:

### Adding activities

```swift
NetworkActivityIndicatorManager.add("Loading timeline")
```

### Removing activities

```swift
NetworkActivityIndicatorManager.remove("Loading timeline")
```

### List in progress activities

```swift
NetworkActivityIndicatorManager.all()
```

## Installation

**NetworkActivityIndicatorManager** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NetworkActivityIndicatorManager'
```

## License

**NetworkActivityIndicatorManager** is available under the MIT license. See the LICENSE file for more info.

## Author

Elvis Nuñez, [@3lvis](https://twitter.com/3lvis)
