# NetworkActivityIndicator

[![Version](https://img.shields.io/cocoapods/v/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/NetworkActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/NetworkActivityIndicator)

## Usage

Adding an activity to the network activity indicator manager is fairly simple:

### Adding activities

```swift
NetworkActivityIndicator.add("Loading timeline")
```

### Removing activities

```swift
NetworkActivityIndicator.remove("Loading timeline")
```

### List in progress activities

```swift
NetworkActivityIndicator.all()
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
