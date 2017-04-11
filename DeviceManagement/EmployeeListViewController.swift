import UIKit

class EmployeeListViewController: UIViewController, UITableViewDataSource {

	let pageTitle: String? = "Employee List"
	
	let employeeInfo = [
		("Hamed", "Peikari", "Swift v3"),
		("Prashant", "Singh", "Obj-C"),
		("Joseph", "Turbin", "JS ES06"),
		("Henry", "Jacobs", "C#"),
		("Atif", "Faiyaz", "Java"),
		("Domas", "Siaudvytis", "jQuery"),
		("Matthew", "Barrix", "C++")
	]
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return employeeInfo.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let (fName, lName, _) = employeeInfo[indexPath.row]
		cell.textLabel?.text = "\(fName) \(lName)"
		return cell
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		title = pageTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
