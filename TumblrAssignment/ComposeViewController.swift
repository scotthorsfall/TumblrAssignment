//
//  ComposeViewController.swift
//  TumblrAssignment
//
//  Created by Scott Horsfall on 6/11/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet var composeIcons: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        print("view will appear")
        
        // set compose buttons below screen
        for icon in composeIcons {
            icon.alpha = 1
            icon.center.y = 667
            
            let downGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ComposeViewController.onCustomPress(_:)))
            downGestureRecognizer.minimumPressDuration = 0.0
            icon.addGestureRecognizer(downGestureRecognizer)
        }
        
    }
    
    func onCustomPress(sender: UILongPressGestureRecognizer) {
        
        let icon = sender.view as! UIImageView
        
        if sender.state == UIGestureRecognizerState.Began {
            icon.alpha = 0.5
        } else if sender.state == UIGestureRecognizerState.Ended {
            icon.alpha = 1
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        print("view did appear")
        
        let topRow: CGFloat! = 178
        let bottomRow: CGFloat! = 304
        
        // animate compose buttons into view
        UIView.animateWithDuration(0.4) {
            self.composeIcons[1].center.y = topRow
        }
        
        self.delay(0.15) {
            UIView.animateWithDuration(0.4) {
                self.composeIcons[2].center.y = topRow
                self.composeIcons[4].center.y = bottomRow
            }
        }
        self.delay(0.25) {
            UIView.animateWithDuration(0.4) {
                self.composeIcons[0].center.y = topRow
            }
        }
        self.delay(0.35) {
            UIView.animateWithDuration(0.4) {
                self.composeIcons[3].center.y = bottomRow
            }
        }
        self.delay(0.4) {
            UIView.animateWithDuration(0.4) {
                self.composeIcons[5].center.y = bottomRow
            }
        }
        
    }
    
    
    @IBAction func onNevermindTap(sender: AnyObject) {
        
        let iconHeight = self.composeIcons[0].frame.height
        
        // animate compose buttons into view
        UIView.animateWithDuration(0.4) {
            self.composeIcons[1].center.y = -iconHeight
        }
        
        self.delay(0.15) {
            UIView.animateWithDuration(0.4) {
                self.composeIcons[2].center.y = -iconHeight
                self.composeIcons[4].center.y = -iconHeight
            }
        }
        self.delay(0.25) {
            UIView.animateWithDuration(0.4) {
                self.composeIcons[0].center.y = -iconHeight
            }
        }
        self.delay(0.35) {
            UIView.animateWithDuration(0.4) {
                self.composeIcons[3].center.y = -iconHeight
            }
        }
        self.delay(0.4) {
            UIView.animateWithDuration(0.4, animations: {
                
                self.composeIcons[5].center.y = -iconHeight
                
            }) { (Bool) in
               
                // do this after compose buttons move off screen
                for icons in self.composeIcons {
                    icons.alpha = 0
                }
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    

}
