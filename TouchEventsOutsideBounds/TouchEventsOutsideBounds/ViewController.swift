//
//  ViewController.swift
//  TouchEventsOutsideBounds
//
//  Created by Pete Smith on 17/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    private var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didPressButton(_ sender: Any) {
        label.text = "Tap \(count)"
        count += 1
    }
}

