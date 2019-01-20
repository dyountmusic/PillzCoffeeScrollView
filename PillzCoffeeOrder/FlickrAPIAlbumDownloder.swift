//
//  FlickrAPIAlbumDownloder.swift
//  PillzCoffeeOrder
//
//  Created by Daniel Yount on 1/19/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation
import UIKit

struct FlickrAPIKeys {
    var key = "647b4492cb0c134e814dc517d6d3d69b"
    var secret = "48bb98dd155e3ab4"
    let flickrUrl = "https://api.flickr.com/services/rest/"
    let formatType = "format=json"
    let method = "flickr.photos.getSizes"
    let nojsoncallback = 1
}

struct PhotoIDURLs {
    var ids = ["46705573202", "46033471224", "46033470884", "46705572952", "46033470694", "46033470414"]
    var urls = ["https://api.flickr.com/services/rest/?api_key=647b4492cb0c134e814dc517d6d3d69b&method=flickr.photos.getSizes&photo_id=46033471224&nojsoncallback=1&format=json", ]
    var photoURLs = ["https://farm5.staticflickr.com/4873/46705573202_9be77876f7.jpg", "https://farm8.staticflickr.com/7838/46033471224_a5af5c2fb6.jpg", "https://farm8.staticflickr.com/7850/46033470884_28dfc6c6fb.jpg", "https://farm8.staticflickr.com/7836/46705572952_33f45f64a2.jpg", "https://farm5.staticflickr.com/4839/46033470694_2597433c7d.jpg", "https://farm8.staticflickr.com/7810/46033470414_5a3652f328.jpg"]
}

//https://api.flickr.com/services/rest/?api_key=647b4492cb0c134e814dc517d6d3d69b&method=flickr.photos.getSizes&photo_id=46033471224&nojsoncallback=1&format=json

class FlickrAPIAlbumDownloader {
    
    var images = [UIImage]()
    
    func downloadAlbum() {
        let photoIDs = PhotoIDURLs()
        for pID in photoIDs.photoURLs {
            let url = URL(string: pID)!
            getData(from: url) { (data, response, error) in
                if error != nil {
                    guard let data = data else { return }
                    guard let image = UIImage(data: data) else { return }
                    self.images.append(image)
                }
                print("complete!")
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
