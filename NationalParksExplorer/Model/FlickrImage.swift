//
//  FlickerImage.swift
//  NationalParksExplorer
//
//  Created by AJMac on 4/24/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import Foundation
import UIKit

class FlickrImage {
    
    var photoData: FlickrPhotoData?
    var thumbnail: UIImage?
    var full: UIImage?
    
    init(photoData: FlickrPhotoData) {
        self.photoData = photoData
    }
    
    var thumbnailURL: String? {
        guard let photo = photoData else { return nil }
        return "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_q.jpg"
    }
    
    var fullURL: String? {
        guard let photo = photoData else { return nil }
        return "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_b.jpg"
    }
}
