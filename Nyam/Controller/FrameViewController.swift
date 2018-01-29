//
//  FrameViewController.swift
//  Nyam
//
//  Created by Ade Suluh on 28/01/18.
//  Copyright © 2018 Ade Suluh. All rights reserved.
//

import UIKit

class FrameViewController: UIViewController {
    
    @IBOutlet weak var imageToEdit: UIImageView!
    @IBOutlet weak var frame1: UIButton!
    var newImage: UIImage!
    
    @IBOutlet weak var foodNameFrame1: UIButton!
    @IBOutlet weak var ratingFoodFrame1: UIButton!
    
    @IBOutlet weak var foodNameFrame2: UIButton!
    @IBOutlet weak var bgOverlayFrame2: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageToEdit.image = newImage
        
        bgOverlayFrame2.backgroundColor = UIColor(white: 0.05, alpha: 0.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIApplication.shared.isStatusBarHidden = true
        
        foodNameFrame1.isHidden = true
        ratingFoodFrame1.isHidden = true
        
        foodNameFrame2.isHidden = true
        bgOverlayFrame2.isHidden = true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func initiateFrame1(_ sender: Any) {
        foodNameFrame1.isHidden = false
        ratingFoodFrame1.isHidden = false
        
        foodNameFrame2.isHidden = true
        bgOverlayFrame2.isHidden = true
    }
    
    @IBAction func initiateFrame2(_ sender: Any) {
        foodNameFrame2.isHidden = false
        bgOverlayFrame2.isHidden = false
        
        foodNameFrame1.isHidden = true
        ratingFoodFrame1.isHidden = true
    }
    
}






