//
//  ViewController.swift
//  Nyam
//
//  Created by Ade Suluh on 28/01/18.
//  Copyright © 2018 Ade Suluh. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController {
    
    @IBOutlet weak var imagePicker: UIImageView!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var takeFromLibrary: UIBarButtonItem!
    @IBOutlet weak var takeFromCamera: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    private var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        takeFromCamera.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        UIApplication.shared.isStatusBarHidden = true
        doneButton.isEnabled = configureButton()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func takePhotoFromLibrary(_ sender: UIBarButtonItem) {
        launchImagePicker(sender: sender)
    }
    
    
    @IBAction func takePhotoFromCamera(_ sender: UIBarButtonItem) {
        launchImagePicker(sender: sender)
    }
    
    func launchImagePicker(sender: UIBarButtonItem)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        switch sender {
        case takeFromLibrary:
            imagePicker.sourceType = .photoLibrary
        case takeFromCamera:
            imagePicker.sourceType = .camera
        default:
            break
        }
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func goToFrameEdit(_ sender: Any) {
        performSegue(withIdentifier: "ChooseFrame", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseFrame" {
            if let frameVC = segue.destination as? FrameViewController {
                frameVC.newImage = imagePicker.image
            }
        }
    }
    
    
    func configureButton() -> Bool
    {
        if imagePicker.image != nil {
            return true
        } else {
            return false
        }
    }
    
}

extension CaptureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imagePicker.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
