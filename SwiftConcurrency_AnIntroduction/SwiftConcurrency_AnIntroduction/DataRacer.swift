//
//  BadActor.swift
//  BadActor
//
//  Created by Pete Smith on 19/07/2021.
//

import Foundation

final class DataRacer {

    var count: Int = 0
    var finished = false
    let limit = 5

    func displayAndUpdate() {
        guard count < 5, !finished else {
            print("Exiting...")
            finished = true
            return
        }

        print("Message \(count)")
        count+=1
    }
}
