//
//  HomeVC.swift
//  FilterAppDemo
//
//  Created by iMac on 09/03/2023.
//

import UIKit
import Photos

class HomeVC: UIViewController {

    let imagePickerVC = UIImagePickerController()
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        button.center = view.center
        button.setTitle("Pick Image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
//        button.backgroundColor = UIColor(named: "#31B1E5")
        button.backgroundColor = UIColor(red: 49.0/255, green: 177.0/255, blue: 229.0/255, alpha: 1.0)
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonTapped)))
        view.addSubview(button)
    }
    
    @objc func buttonTapped(_ sender: Any) {
        
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self // new
        present(imagePickerVC, animated: true)
    }


}

// MARK: UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension HomeVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        if let image = info[.originalImage] as? UIImage {
            showFilter(image: image)
        }
    }
    
    func showFilter(image: UIImage){
        
        let vc = FilterVC()
        vc.image = image
        vc.backgroundColor = .white
        vc.textColor = .black
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}

// MARK: FilterVCDelegate
extension HomeVC: FilterVCDelegate {
    
    func didFilter(_ image: UIImage) {
        print("Image", image)
    }
    
    // Called when Done Button Tapped
    func didFinish(_ image: UIImage) {
        print("image", image)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 60, width: 200, height: 200)
        imageView.center.x = view.center.x
        view.addSubview(imageView)
        
        PHPhotoLibrary.shared().performChanges {
            _ = PHAssetChangeRequest.creationRequestForAsset(from: image)

       
        } completionHandler: { (success, error) in
            
            
        }
    }
    
    // Called when Cancel Button Tapped
    func didCancel() {
        print("did Cancel")
    }
}
