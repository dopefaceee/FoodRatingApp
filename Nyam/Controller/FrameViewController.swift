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

    override func viewDidLoad() {
        super.viewDidLoad()
        imageToEdit.image = newImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIApplication.shared.isStatusBarHidden = true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func ImageFrame1(_ sender: Any) {
        
    }
    
}
