import UIKit

class EmployeeListViewController: UITableViewController {

	// local variables
	var selectedEmpCellIndex = 0
	
	let employeeInfo = [
		("Hamed", "Peikari", "Swift v3"),
		("Prashant", "Singh", "Obj-C"),
		("Joseph", "Turbin", "JS ES06"),
		("Henry", "Jacobs", "C#"),
		("Atif", "Faiyaz", "Java"),
		("Domas", "Siaudvytis", "jQuery"),
		("Matthew", "Barrix", "C++")
	]
	

	// number of rows
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return employeeInfo.count
	}
	
	// content of each cell in table view
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let (fName, lName, _) = employeeInfo[indexPath.row]
		cell.textLabel?.text = "\(fName) \(lName)"
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedEmpCellIndex = indexPath.row
		performSegue(withIdentifier: "employeeDescSegue", sender: self)
	}
	
	// reference data to be passed to next view controller using "prepare for segue"
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let employeeDescController = segue.destination as! EmployeeDescViewController
		
		employeeDescController.selectedEmployeeInfo = employeeInfo[selectedEmpCellIndex]
	}
}
