//
//  ImageService.swift
//  NutsMarket
//
//  Created by Станислав Климов on 18.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    init() {}
    
    
    func getImageData(from url: String?) -> Data? {
        guard let url = url else { return nil }
        guard let imageURl = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURl) else { return nil }
        return imageData
    }
}
