//
//  CropImageViewController.swift
//  UploadProfileImagePOC
//
//  Created by Sweda Thiyagarajan on 31/05/2022.
//

import UIKit

class CropImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate {
    
    var pickImage = UIImagePickerController()
    var circlePath = UIBezierPath()
    var removeLayer : Bool = false
    var chosenImage : UIImage!
    var imagePicker : ImageViewController!
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    {
        didSet{
            scroll.delegate = self
            scroll.minimumZoomScale = 1.0
            scroll.maximumZoomScale = 10.0
            scroll.zoomScale = 1.0
        }
    }
    
    let size : CGFloat = 400
    var layerAdded : Bool = false
    var crop: CropView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crop = CropView()
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pangest));
        crop.backgroundColor = UIColor.lightGray
        crop.addGestureRecognizer(gestureRecognizer)
        
        crop.layer.cornerRadius = crop.frame.size.width/2
        crop.clipsToBounds = true

        crop.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        crop.layer.borderWidth = 5.0
        
        profilePic.image = chosenImage
        layer(x: (self.view.frame.size.width / 2) - (size/2), y: (self.view.frame.size.height / 2) - (size / 2), width: size,height: size,cornerRadius: size / 2)
        
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func cropPhoto(_ sender: UIButton) {
        let croppedCGImage = profilePic.image?.cgImage?.cropping(to: cropArea)
        let croppedImage = UIImage(cgImage: croppedCGImage!)
        imagePicker.profilePic.image = croppedImage
        self.dismiss(animated: true)
    }
    
    @IBAction func pangest(_ gestureRecognizer: UIPanGestureRecognizer)
    {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed
        {
            let translation = gestureRecognizer.translation(in: view)
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: view)
        }
    }
    
    var cropArea:CGRect
    {
        get{
            let factor = profilePic.image!.size.width/view.frame.width
            let scale = 1/scroll.zoomScale
            let imageFrame = profilePic.imageFrame()
            let x = (scroll.contentOffset.x + circlePath.bounds.origin.x - imageFrame.origin.x) * scale * factor
            let y = (scroll.contentOffset.y + circlePath.bounds.origin.y - imageFrame.origin.y) * scale * factor
            let width =  circlePath.bounds.width  * scale * factor
            let height = circlePath.bounds.height  * scale * factor
            return CGRect(x: x, y: y, width: width, height: height)
        }
        
    }
    
    func layer(x: CGFloat,y: CGFloat,width: CGFloat,height: CGFloat,cornerRadius: CGFloat)
    {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), cornerRadius: 0)
        circlePath = UIBezierPath(roundedRect: CGRect(x: x,y: y,width: width,height: height), cornerRadius: cornerRadius)
        path.append(circlePath)
        path.usesEvenOddFillRule = true
        let fillLayer = CAShapeLayer()
        fillLayer.path = path.cgPath
        fillLayer.fillRule = CAShapeLayerFillRule.evenOdd
        fillLayer.opacity = 0.7
        fillLayer.fillColor = UIColor.lightGray.cgColor
       
        if removeLayer {
            fillLayer.removeFromSuperlayer()
            layerAdded = false
        } else if !layerAdded {
            view.layer.addSublayer(fillLayer)
            layerAdded = true
        }
    }
    
    //MARK: -UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return profilePic
    }
}

extension UIImageView
{
    func imageFrame()->CGRect
    {
        let imageViewSize = self.frame.size
        guard let imageSize = self.image?.size else
        {
            return CGRect.zero
        }
        let imageRatio = imageSize.width / imageSize.height
        let imageViewRatio = imageViewSize.width / imageViewSize.height
        if imageRatio < imageViewRatio
        {
            let scaleFactor = imageViewSize.height / imageSize.height
            let width = imageSize.width * scaleFactor
            let topLeftX = (imageViewSize.width - width) * 0.5
            return CGRect(x: topLeftX, y: 0, width: width, height: imageViewSize.height)
        }
        else
        {
            let scalFactor = imageViewSize.width / imageSize.width
            let height = imageSize.height * scalFactor
            let topLeftY = (imageViewSize.height - height) * 0.5
            return CGRect(x: 0, y: topLeftY, width: imageViewSize.width, height: height)
        }
    }
}

