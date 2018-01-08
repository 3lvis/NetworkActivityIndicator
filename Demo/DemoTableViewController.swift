import UIKit

class DemoTableViewController: UITableViewController {
    struct Option {
        var activated = false
    }
    
    var dataSource = [Option(), Option(), Option(), Option()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let option = dataSource[indexPath.row]
        cell.textLabel?.text = option.activated ? "Stop activity" : "Run activity"
        cell.textLabel?.textColor = option.activated ? UIColor.red : UIColor.blue
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.hidesWhenStopped = true
        cell.accessoryView = indicator
        
        if option.activated {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var option = dataSource[indexPath.row]
        option.activated = !option.activated
        dataSource[indexPath.row] = option
        
        NetworkActivityIndicator.shared.visible = option.activated
        
        tableView.reloadData()
    }
}
