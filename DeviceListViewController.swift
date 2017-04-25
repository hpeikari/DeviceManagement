import UIKit

// WARNING: GLOBAL VARIABLES !
var selectedDeviceCellIndex = 0

let deviceList = [
	("Apple", "Apple related info", "v10.0.2"),
	("Windows", "WinOS related info", "v10"),
	("Android", "Android OS stuff", "v7.1")
]


class DeviceListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
	
	let pageTitle: String? = "Device List"

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedDeviceCellIndex = indexPath.row
		performSegue(withIdentifier: "deviceDescSegue", sender: self)
	}
	
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
}
