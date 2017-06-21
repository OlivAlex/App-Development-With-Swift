//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Invitado on 6/20/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let photoInfoController = PhotoInfoController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        
        guard let url = photoInfo.url.withHTTPS() else { return }
        
        let task = URLSession.shared.dataTask(with: url,
        completionHandler: { (data, response, error) in
        
            if let data = data,
            let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.imageView.image = image
                    self.descriptionLabel.text = photoInfo.description
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                        
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        })
        task.resume()
    }
}

