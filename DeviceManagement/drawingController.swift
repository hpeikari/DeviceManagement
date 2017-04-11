//
//  drawingController.swift
//  DeviceManagement
//
//  Created by Hamed Peikari on 1/13/17.
//  Copyright © 2017 Hamed Peikari. All rights reserved.
//

import UIKit

class drawingController: UIView {

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
		let bgImage = UIImage(named: "background.png")
		
		let screenSize = UIScreen.main.bounds
		bgImage?.draw(in: screenSize)
    }
}
