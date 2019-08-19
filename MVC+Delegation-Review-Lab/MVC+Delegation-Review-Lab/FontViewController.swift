//
//  FontViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by EricM on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class FontViewController: UIViewController {
    
    var delegate: ChangingText?
    
    @IBOutlet weak var slide: UISlider!
    @IBOutlet weak var countButton: UIStepper!
    @IBOutlet weak var fontSize: UILabel!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        countButton.value = Double((sender.value))
        delegate?.textFont(fontSize: CGFloat(sender.value))
        fontSize.text = "Font Size: \(sender.value)"
    }
    @IBAction func stepAction(_ sender: UIStepper) {
        slide.value = Float(sender.value)
        delegate?.textFont(fontSize: CGFloat(sender.value))
        fontSize.text = "Font Size: \(sender.value)"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
