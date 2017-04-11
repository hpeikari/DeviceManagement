import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

	let pageTitle: String? = "Login"
	let delayTime = 3
	
	@IBOutlet weak var labelMsg: UILabel!
	@IBOutlet weak var labelGreeting: UILabel!
	@IBOutlet weak var userNameInput: UITextField!
	@IBOutlet weak var passwordInput: UITextField!
	
	@IBOutlet weak var loginActivity: UIActivityIndicatorView!
	
	@IBAction func loginBtnClickec(_ sender: UIButton) {
		loginActivity.startAnimating()
		self.loginActivity.center = self.view.center

		// hide keyboard
		userNameInput.resignFirstResponder()
		passwordInput.resignFirstResponder()
		
		if self.userNameInput.text!.isEmpty || self.passwordInput.text!.isEmpty {
			self.labelGreeting.textColor = UIColor.red
			self.labelGreeting.text = "You have to enter both UserName and Password."
			
			self.loginActivity.stopAnimating()
		} else {
			self.labelGreeting.textColor = UIColor.green
			self.labelGreeting.text = "Please wait \(delayTime) seconds so we can check your authentication"
		
			DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delayTime), execute: {
				self.loginActivity.stopAnimating()
				
				self.performSegue(withIdentifier: "loginSegueIdentifier", sender: self)
			})
		}
		
	}
	
	// hiding keyboard when anywhere on the screen is touched
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
	
	// hide keyboard when user press return key
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		userNameInput.resignFirstResponder()
		passwordInput.resignFirstResponder()
		return false
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		title = pageTitle
		labelMsg.text = ""
		labelGreeting.text = "Please login first..."
		
		//let context = UIGraphicsGetCurrentContext()
		//let bgImage = UIImage(named: "background.png")
		//let screenSize = UIScreen.main.bounds
		//bgImage?.draw(in: screenSize)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

