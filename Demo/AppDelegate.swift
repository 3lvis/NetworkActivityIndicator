import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: Controller())
        self.window!.makeKeyAndVisible()
        return true
    }
}

class Controller: UITableViewController {
    struct Option {
        var activated = false
    }

    var dataSource = [Option(), Option(), Option(), Option()]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Simulated activities"
        self.tableView.rowHeight = 60
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let option = self.dataSource[indexPath.row]
        cell.textLabel?.text = option.activated ? "Stop activity" : "Run activity"
        cell.textLabel?.textColor = option.activated ? UIColor.redColor() : UIColor.blueColor()

        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        indicator.hidesWhenStopped = true
        cell.accessoryView = indicator

        if option.activated {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var option = self.dataSource[indexPath.row]
        option.activated = !option.activated
        self.dataSource[indexPath.row] = option

        NetworkActivityIndicator.sharedIndicator.visible = option.activated

        self.tableView.reloadData()
    }
}
