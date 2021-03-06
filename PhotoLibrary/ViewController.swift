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
        openPhotoLib()
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        saveImage()
    }
    
    private func saveImage() {
        let imageData = ImageView.image?.jpegData(compressionQuality: 0.6)
        let compressedJpegImage = UIImage(data: imageData!)
        
        UIImageWriteToSavedPhotosAlbum(compressedJpegImage!, nil, nil, nil)
        
        showAlert(withMessage: "Your image has been saved!")
    }
    
    private func showAlert(withMessage message: String) {
        let alertController = UIAlertController(title: "Complete", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // get the image from the 'info' parameter
        guard let pickedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected an image but was provided with : \(info)")
        }
        
        ImageView.image = pickedImage
        dismiss(animated: true, completion: nil)
    }
}

