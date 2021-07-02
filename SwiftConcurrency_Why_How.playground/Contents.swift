import UIKit
import OSLog

let logger = Logger()

func fetchSomeData(withCompletion completion: @escaping (Result<[Int], Error>) -> Void) {

    let url = URL(string: "https://www.myapi.com/getdata")!
    URLSession.shared.dataTask(with: url) { data, response, error in

        // Check for error
        guard error == nil else {
            logger.error("Error received")
            completion(.failure(error!))
            return
        }

        // Check for successful HTTP response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            logger.error("HTTP response code is not 200")
            // 😱 FORGOT TO CALL COMPLETION HANDLER!
            return
        }

        // Decode data etc.
        // ...
    }
}
