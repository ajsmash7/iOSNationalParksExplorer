//
//  FlickrPhotoSet.swift
//  NationalParksExplorer
//
//  Created by AJMac on 4/24/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoSet {
    
    var photos: [FlickrPhotoData]
    var images: [FlickrImage]
    
    let flickrService = FlickrService()
    
    init(photos: [FlickrPhotoData]) {
        self.photos = photos
        self.images = self.photos.map( { FlickrImage(photoData: $0) } )
    }
    
    func downloadThumbnailFor(index: Int, completion: @escaping (UIImage?, Error?) -> Void) {
        let image = images[index]
        flickrService.downloadImage(url: image.thumbnailURL!, completion: { (image: UIImage?, error: Error?) in
            self.images[index].thumbnail = image
            completion(image, error)
        })
    }
    var count: Int {
        return images.count
    }
    
    func photoAt(index: Int) -> FlickrPhotoData? {
        return photos[index]
    }
}
