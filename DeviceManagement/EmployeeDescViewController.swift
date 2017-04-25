import UIKit

class EmployeeDescViewController: UIViewController {
	@IBOutlet weak var EmployeeNameLabel: UILabel!
	@IBOutlet weak var talentLabel: UILabel!
	
	var selectedEmployeeInfo = ("", "", "") // tuple of empty strings
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		let (fName, lName, talent) = selectedEmployeeInfo // decompose the tuple
		
		EmployeeNameLabel.text = "\(fName) \(lName)"
		talentLabel.text = talent
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
