//
//  UIImageView+downloadImage.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 3/16/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImageFrom(link:String) {
        let dataTask = URLSession.shared.dataTask(with: URL(string:link)!, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async {
                if let data = data { self.image = UIImage(data: data) }
            }
        })
        
        dataTask.resume()
    }
}
