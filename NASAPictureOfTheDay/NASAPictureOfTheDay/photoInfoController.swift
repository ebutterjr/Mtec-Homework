//
//  photoInfoController.swift
//  NASAPictureOfTheDay
//
//  Created by Easton Butterfield on 11/30/22.
//

import Foundation
import UIKit
class PhotoInfoController{
    
    func fetchPhotoInfo() async throws -> PhotoInfo {
        var urlComponents = URLComponents(string:
                                            "https://api.nasa.gov/planetary/apod")!
        urlComponents.queryItems = [
            "api_key": "DEMO_KEY",
            "date": "2003-07-07"
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw PhotoInfoError.itemNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
        return(photoInfo)
    }
    enum PhotoInfoError: Error, LocalizedError {
        case itemNotFound
        case imageDataMissing
    }
    func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw PhotoInfoError.imageDataMissing
        }
        
        guard let image = UIImage(data: data) else {
            throw PhotoInfoError.imageDataMissing
        }
        
        return image
    } 
}
