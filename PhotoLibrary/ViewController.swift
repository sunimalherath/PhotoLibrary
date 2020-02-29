//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by Sunimal Herath on 29/2/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var ImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //IBActions
    @IBAction func openCameraBtnPressed(_ sender: Any) {
        openCamera()
    }
    
    @IBAction func openPhotoLibBtnPressed(_ sender: Any) {
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
    }
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // create an instance of the UIImagePickerController to access its features
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func openPhotoLib(){
        
    }
}

