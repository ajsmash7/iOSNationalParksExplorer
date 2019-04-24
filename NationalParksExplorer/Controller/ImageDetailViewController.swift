//
//  ImageDetailViewController.swift
//  NationalParksExplorer
//
//  Created by AJMac on 4/24/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import Foundation
import UIKit

class ImageDetailViewController: UIViewController {
    
    var flickrImage: FlickrImage?
    var flickrService = FlickrService()
    
    @IBOutlet var photoDetails: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Photo Detail"
        
        loadingIndicator.startAnimating()
        
        let photoData = flickrImage!.photoData
        photoDetails.text = photoData!.title
        let url = flickrImage!.fullURL
        
        flickrService.downloadImage(url: url!) { (image: UIImage?, error: Error?) -> Void in
            DispatchQueue.main.async {
                
                self.loadingIndicator.stopAnimating()
                
                if let error = error {
                    print(error)
                    self.present(ErrorAlertController.alert(message: "Error fetching photo"), animated: true)
                }
                else {
                    self.imageView.image = image
                }
            }
        }
    }
}
