import UIKit

class DeviceDescViewController: UIViewController {
	
	@IBOutlet weak var deviceLabel: UILabel!
	@IBOutlet weak var versionLabel: UILabel!
	@IBOutlet weak var descLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		let (deviceName, deviceDesc, deviceVersion) = deviceList[selectedDeviceCellIndex]
		
		deviceLabel.text = deviceName
		versionLabel.text = deviceVersion
		descLabel.text = deviceDesc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
