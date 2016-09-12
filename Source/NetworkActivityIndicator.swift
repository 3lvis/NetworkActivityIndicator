#if os(iOS)
    import UIKit
#endif

open class NetworkActivityIndicator: NSObject {

    /**
     The shared instance.
     */
    open static let sharedIndicator = NetworkActivityIndicator()

    /**
     The number of activities in progress.
     */
    internal var activitiesCount = 0

    /**
     A Boolean value that turns an indicator of network activity on or off.

     Specify true if the app should show network activity and false if it should not. The default value is false. A spinning indicator in the status bar shows network activity. Multiple calls to visible cause an internal counter to take care of persisting the number of times this method has being called.
     */
    open var visible: Bool = false {
        didSet {
            if visible {
                self.activitiesCount += 1
            } else {
                self.activitiesCount -= 1
            }

            if self.activitiesCount < 0 {
                self.activitiesCount = 0
            }

            #if os(iOS)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = (self.activitiesCount > 0)
                })
            #endif
        }
    }
}
