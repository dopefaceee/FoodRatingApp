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
    
    @IBOutlet weak var tabBarEditor: UITabBar!
   
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageToEdit.image = newImage
        
        tabBarEditor.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    
}

extension FrameViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    
    
}






