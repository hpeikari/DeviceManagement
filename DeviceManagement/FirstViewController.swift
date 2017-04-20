import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

	let pageTitle: String? = "Login"
	let delayTime = 3 // seconds
	let timeInterval: Float = 0.25 // seconds
	var progressTimer = Timer()
	var counter: Float = 0
	
	@IBOutlet weak var labelMsg: UILabel!
	@IBOutlet weak var labelGreeting: UILabel!
	@IBOutlet weak var userNameInput: UITextField!
	@IBOutlet weak var passwordInput: UITextField!
	@IBOutlet weak var progressBar: UIProgressView!
	
	@IBOutlet weak var loginActivity: UIActivityIndicatorView!
	
	@IBAction func loginBtnClickec(_ sender: UIButton) {
		loginActivity.startAnimating()
		// self.loginActivity.center = self.view.center

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
		
			// update progress bar every second
			progressTimer = Timer.scheduledTimer(timeInterval: Double(timeInterval), target: self, selector: #selector(self.updateProgressBar), userInfo: nil, repeats: true);
			
			
			DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delayTime), execute: {
				self.loginActivity.stopAnimating()
				self.invalidateProgressBar()
				
				self.performSegue(withIdentifier: "loginSegueIdentifier", sender: self)
			})
		}
		
	}
	
	func updateProgressBar() {
		counter += timeInterval
		progressBar.progress = counter / Float(delayTime)
	}
	
	func invalidateProgressBar() {
		counter = 0
		progressBar.progress = 0
		progressTimer.invalidate()
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
		progressBar.progress = 0
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

