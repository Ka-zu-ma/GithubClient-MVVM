//
//  ImageDownloder.swift
//  GithubClient-MVVM
//
//  Created by 千葉大志 on 2018/04/09.
//  Copyright © 2018年 bati. All rights reserved.
//

import Foundation
import UIKit

final class ImageDownloader {
    var cacheImage: UIImage?
    
    func downloadImage(imageURL: String,
                       success: @escaping (UIImage) -> Void,
                       failure: @escaping (Error) -> Void) {

        if let cacheImage = cacheImage {
            success(cacheImage)
        }
        
        var request = URLRequest(url: URL(string: imageURL)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    failure(error)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    failure(APIError.unknown)
                }
                return
            }
            
            guard let imageFromData = UIImage(data: data) else {
                DispatchQueue.main.async {
                    failure(APIError.unknown)
                }
                return
            }
            
            DispatchQueue.main.async {
                success(imageFromData)
            }
            self.cacheImage = imageFromData
        }
        task.resume()
    }
}

