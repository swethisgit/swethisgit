//
//  ImageViewController.swift
//  UploadProfileImagePOC
//
//  Created by Sweda Thiyagarajan on 08/04/2022.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var pickImage = UIImagePickerController()
    var circlePath = UIBezierPath()
    var removeLayer : Bool = false
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.layer.cornerRadius = profilePic.frame.size.width/2
        profilePic.clipsToBounds = true
        
        profilePic.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        profilePic.layer.borderWidth = 5.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pickImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            pickImage.delegate = self
            pickImage.sourceType = .savedPhotosAlbum
            pickImage.allowsEditing = false
            present(pickImage, animated: true, completion: nil)
        }
    }
    
    //MARK: - Image picker handlers
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: { () -> Void in
        })
        
   
        let chosenImage = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as! UIImage
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CropImage") as! CropImageViewController
        self.present(controller, animated: true, completion: nil)
        controller.imagePicker = self
        controller.chosenImage = chosenImage
    }
    
}

