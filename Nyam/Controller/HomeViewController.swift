//
//  HomeViewController.swift
//  Nyam
//
//  Created by Ade Suluh on 31/01/18.
//  Copyright © 2018 Ade Suluh. All rights reserved.
//

import UIKit
import Pastel
import Fusuma

class HomeViewController: UIViewController, FusumaDelegate {
    
     private var selectedImage: UIImage?

    @IBOutlet weak var editPhotoButton: UIButton! {
        didSet {
            editPhotoButton.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
            editPhotoButton.layer.borderWidth = 1.0
            editPhotoButton.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var seeGalleryButton: UIButton! {
        didSet {
            seeGalleryButton.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
            seeGalleryButton.layer.borderWidth = 1.0
            seeGalleryButton.layer.cornerRadius = 4
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 3.0
        
        //Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
        
    }
    
    @IBAction func takePhotoForEditing(_ sender: Any) {
        
        //show fusuma
        let fusuma = FusumaViewController()
        fusuma.delegate = self
        fusuma.allowMultipleSelection = false
        
        //fusuma.availableModes = [.video]
        
        fusumaSavesImage = true
        
        self.present(fusuma, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "testBos" {
            if let frameVC = segue.destination as? FrameViewController {
                frameVC.newImage = selectedImage
            }
        }
    }
    
    // MARK: Fusuma Delegate
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
        switch source {
        case .camera:
            print("Image capture from Camera")
        case .library:
            print("Image selected from library")
        case .video:
            print("Image taken from Video")
        default:
            print("Image selected")
        }
        
        //imageView.image = image CHANGE PLACEHOLDER IMAGE
        selectedImage = image
        
        //for next vc
        self.performSegue(withIdentifier: "testBos", sender: nil)
    }
    
    func fusumaMultipleImageSelected(_ images: [UIImage], source: FusumaMode) {
        
        print("Number of selection images: \(images.count)")
        
        var count: Double = 0
        
        for image in images {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (3.0 * count)) {
                
                //self.imageView.image = image
                print("w: \(image.size.width) - h: \(image.size.height)")
            }
            count += 1
        }
        
        //self.performSegue(withIdentifier: "testBos", sender: nil)
        
    }
    
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode, metaData: ImageMetadata) {
        print("Image mediatype: \(metaData.mediaType)")
        print("Source image size: \(metaData.pixelWidth)x\(metaData.pixelHeight)")
        print("Creation date: \(String(describing: metaData.creationDate))")
        print("Modification date: \(String(describing: metaData.modificationDate))")
        print("Video duration: \(metaData.duration)")
        print("Is favourite: \(metaData.isFavourite)")
        print("Is hidden: \(metaData.isHidden)")
        print("Location: \(String(describing: metaData.location))")
    }
    
    func fusumaVideoCompleted(withFileURL fileURL: URL) {
        
        //print("video completed and output to file: \(fileURL)")
        //self.fileUrlLabel.text = "file output to: \(fileURL.absoluteString)"
    }
    
    func fusumaDismissedWithImage(_ image: UIImage, source: FusumaMode) {
        
        switch source {
            
        case .camera:
            
            print("Called just after dismissed FusumaViewController using Camera")
            
        case .library:
            
            print("Called just after dismissed FusumaViewController using Camera Roll")
            
        case .video:
            
            print("Called just after dismissed FusumaViewController using Video")
            
        default:
            
            print("Called just after dismissed FusumaViewController")
        }
        
        
    }
    
    func fusumaCameraRollUnauthorized() {
        
        print("Camera roll unauthorized")
        
        let alert = UIAlertController(title: "Access Requested",
                                      message: "Saving image needs to access your photo album",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Settings", style: .default) { (action) -> Void in
            
            if let url = URL(string:UIApplicationOpenSettingsURLString) {
                
                UIApplication.shared.openURL(url)
            }
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            
        })
        
        guard let vc = UIApplication.shared.delegate?.window??.rootViewController,
            let presented = vc.presentedViewController else {
                
                return
        }
        
        presented.present(alert, animated: true, completion: nil)
    }
    
    func fusumaClosed() {
        
        print("Called when the FusumaViewController disappeared")
    }
    
    func fusumaWillClosed() {
        
        print("Called when the close button is pressed")
    }


}




























