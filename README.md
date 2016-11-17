# VisibleTouchViewSwift

[![Version](http://img.shields.io/cocoapods/v/VisibleTouchViewSwift.svg)](http://cocoapods.org/?q=VisibleTouchViewSwift)
[![GitHub release](https://img.shields.io/github/release/TrebleFM/VisibleTouchViewSwift.svg)](https://github.com/TrebleFM/VisibleTouchViewSwift/releases)
![Swift 3.0](https://img.shields.io/badge/Swift-3.0-green.svg)
![platforms](https://img.shields.io/badge/platforms-iOS%20-lightgrey.svg)

> Show finger touches on the screen using either a UIView or UIWindow. Useful for app preview videos, live product demos, and more. Based on [EUMTouchPointView](https://github.com/eumlab/EUMTouchPointView).

## Usage

Set `VisibleTouchVWindow` as your Root View Controller

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var controller = Controller()
    
    override init() {
        super.init()
        self.window = VisibleTouchVWindow(frame: UIScreen.mainScreen().bounds)
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window!.rootViewController = Controller()
        window!.makeKeyAndVisible()
        return true
    }
}
```

## Installation

VisibleTouchViewSwift is available through [CocoaPods](http://cocoapods.org/). To install it, simply add the following line to your Podfile:

```
pod 'VisibleTouchViewSwift'
```


## Release History

See `CHANGELOG.md`

## Author

Benjamin Chrobot (@bchrobot), ben@treble.fm

## License

VisibleTouchViewSwift is available under the MIT license. See `LICENSE` for more info.
