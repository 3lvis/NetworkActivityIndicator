import UIKit

public class NetworkActivityIndicator {
    public static let sharedIndicator = NetworkActivityIndicator()

    internal var numberOfCalls = 0

    public var visible: Bool = false {
        didSet {
            if visible {
                self.numberOfCalls++
            } else {
                self.numberOfCalls--
            }

            if self.numberOfCalls < 0 {
                self.numberOfCalls = 0
            }

            dispatch_async(dispatch_get_main_queue()) {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = (self.numberOfCalls > 0)
            }
        }
    }
}
