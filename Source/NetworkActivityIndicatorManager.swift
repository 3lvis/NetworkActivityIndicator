import UIKit

public class NetworkActivityIndicatorManager {
    private var activities = Set<String>()
    private static let sharedInstance = NetworkActivityIndicatorManager()

    /**
     Adds the activity name and displays the network activity indicator. The activity name should be unique, if it already exists it will not be added again.
     - parameter activityName: The name of the activity to be added.
     */
    public static func add(activityName: String) {
        if sharedInstance.activities.contains(activityName) == false {
            sharedInstance.activities.insert(activityName)

            #if os(iOS)
                dispatch_async(dispatch_get_main_queue()) {
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                }
            #endif
        }
    }

    /**
    Removes the activity name and hides the network activity indicator if all activities have been removed.
    - parameter activityName: The name of the activity to be removed.
    */
    public static func remove(activityName: String) {
        if sharedInstance.activities.contains(activityName){
            sharedInstance.activities.remove(activityName)

            #if os(iOS)
                if sharedInstance.activities.isEmpty {
                    dispatch_async(dispatch_get_main_queue()) {
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    }
                }
            #endif
        }
    }

    /**
     Returns all the added activities.
     - returns: An array of all the added activities.
     */
    public static func all() -> [String] {
        return Array(sharedInstance.activities)
    }
}
