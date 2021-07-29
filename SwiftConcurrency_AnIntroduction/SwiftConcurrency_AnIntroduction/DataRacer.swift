//
//  BadActor.swift
//  BadActor
//
//  Created by Pete Smith on 19/07/2021.
//

import Foundation

final class DataRacer {

    var count: Int = 0
    let limit = 5

    func displayAndUpdate() {
        guard count < 5 else {
            return
        }

        print("Message \(count)")
        count+=1
    }
}
