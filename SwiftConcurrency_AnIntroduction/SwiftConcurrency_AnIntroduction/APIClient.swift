//
//  APIClient.swift
//  SwiftConcurrency_AnIntroduction
//
//  Created by Pete Smith on 09/07/2021.
//

import Foundation
import OSLog
import UIKit

enum APIErrors: Error {
    case requestError
    case modelDecodingError
    case imageRequestError
    case imageDecodingError
}

struct APIClient {

    func fetchData(fromURL url: URL, withCompletion completion: @escaping (Result<ModelWrapper, Error>) -> Void) -> Void {

        let firstTask = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(error))
                // 😱 DID NOT RETURN!
            }

            guard let data = data else {
                completion(.failure(APIErrors.requestError))
                return
            }

            guard let model = try? JSONDecoder().decode(Model.self, from: data) else {
                // 😱 DID NOT CALL COMPLETION HANDLER!
                return
            }

            let imageUrl = model.imageURL
            let secondTask = URLSession.shared.dataTask(with: imageUrl) { data, response, error in

                // 😱 PYRAMID OF DOOM STARTING TO FORM!
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(APIErrors.imageRequestError))
                    return
                }

                guard let image = UIImage(data: data) else {
                    // 😱 DID NOT CALL COMPLETION HANDLER!
                    return
                }

                let modelWrapper = ModelWrapper(model: model, image: image)
                completion(.success(modelWrapper))
            }

            secondTask.resume()
        }

        firstTask.resume()
    }

    func fetchData(fromURL url: URL) async throws ->  ModelWrapper {

        let (data, _) = try await  URLSession.shared.data(from: url)
        let model = try JSONDecoder().decode(Model.self, from: data)
        let (imageData, _) = try await URLSession.shared.data(from: model.imageURL)
        guard let image = UIImage(data: imageData) else {
            throw APIErrors.imageDecodingError
        }
        return ModelWrapper(model: model, image: image)
    }
}
