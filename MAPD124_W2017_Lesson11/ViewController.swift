//
//  ViewController.swift
//  MAPD124_W2017_Lesson11
//
//  Created by Tom Tsiliopoulos on 2017-03-28.
//  Copyright © 2017 Tom Tsiliopoulos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var touchesLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func updateLabelsFromTouches(_ touch: UITouch?, allTouches: Set<UITouch>?) {
        let numTaps = touch?.tapCount ?? 0
        let tapMessage = "\(numTaps) taps detected"
        tapsLabel.text = tapMessage
        
        let numTouches = allTouches?.count ?? 0
        let touchMessage = "\(numTouches) touches detected"
        touchesLabel.text = touchMessage
        
        if traitCollection.forceTouchCapability == .available {
            forceLabel.text = "Force: \(touch?.force ?? 0)\nMax force: \(touch?.maximumPossibleForce ?? 0)"
        }
        else {
            forceLabel.text = "3D touch not available"
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageLabel.text = "Touches Began"
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageLabel.text = "Touches Cancelled"
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageLabel.text = "Touches Ended"
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageLabel.text = "Touches Moved"
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }

}

