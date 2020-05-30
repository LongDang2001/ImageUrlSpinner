//
//  ViewController.swift
//  ImageURLSpinner
//
//  Created by admin on 3/28/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinnner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageUrl()
        spinnner.startAnimating()
    }
    
    func imageUrl() {
        let imageUrlString:String = "https://baoxehoi.net/wp-content/uploads/2016/02/anh-sieu-xe-lao-cai.jpg"
        // ép kiểu về url
        guard let imageUrl = URL(string: imageUrlString) else { return }
        
        // Lấy dữ liệu về máy
        DispatchQueue.global().async {
            guard let imageData = NSData(contentsOf: imageUrl ) else { return }
            
            DispatchQueue.main.async {
                // ép về kiểu image
                let image = UIImage(data: imageData as Data)
                self.imageView.image = image
                self.spinnner.isHidden = true
            }
        }
    }


}

