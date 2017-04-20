import UIKit

class MultiplePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	let pickList: [[String]] = [
		["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
		["Morning", "Noon", "Evening", "Overnight"],
		["1 Day", "3 Days", "1 Week", "2 Weeks", "1 Month"]
	]
	
	@IBOutlet weak var multiPickerLabel: UILabel!

	// to handle picker change we need to use delegates as follows
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		multiPickerLabel.text = "You selected \(pickList[component][row])"
	}
	
	// number of picker components
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return pickList.count
	}
	
	// number of items in each component
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickList[component].count
	}
	
	// title of items to be displayed
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickList[component][row]
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
