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
    
    @IBOutlet weak var collectionViewFrame: UICollectionView!
   
    var newImage: UIImage!
    
    let FrameCellId: String = "FrameCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageToEdit.image = newImage
        
        tabBarEditor.delegate = self
        collectionViewFrame.delegate = self
        collectionViewFrame.dataSource = self
        
        tabBarEditor.selectedItem = tabBarEditor.items![0]
        
        let nibCell = UINib(nibName: FrameCellId, bundle: nil)
        collectionViewFrame.register(nibCell, forCellWithReuseIdentifier: FrameCellId)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    
    
}

extension FrameViewController:  UITabBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        if item == (tabBar.items as! [UITabBarItem])[0] {
            print("Index 0 is hitted!")
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewFrame.dequeueReusableCell(withReuseIdentifier: FrameCellId, for: indexPath) as? FrameCell
        cell?.labelFrame.text = "Frame1"
        
        return cell!
    }
    
    
}



















