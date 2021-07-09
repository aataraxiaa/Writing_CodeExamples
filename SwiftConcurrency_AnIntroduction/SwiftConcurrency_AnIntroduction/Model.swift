//
//  Model.swift
//  SwiftConcurrency_AnIntroduction
//
//  Created by Pete Smith on 09/07/2021.
//

import Foundation
import UIKit

struct Model: Decodable {
    let id: Int 
    let name: String
    let imageURL: URL
}

struct ModelWrapper {
    let model: Model
    let image: UIImage
}
