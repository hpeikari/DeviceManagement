import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {

	let pageTitle: String? = "Device List"
	
	let deviceList = [
		("Apple", "Apple related info", "v10.0.2"),
		("Windows", "WinOS related info", "v10"),
		("Android", "Android OS stuff", "v7.1")
	]
	
	// number of sections in table view
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	// number of rows in table view
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return deviceList.count
	}
	
	// content of each cell in table view
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let (devName, _, _) = deviceList[indexPath.row]
		cell.textLabel?.text = devName
		return cell
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		title = pageTitle
    }
	
	// hide back button
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		//self.tabBarController?.navigationItem.hidesBackButton = true
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
