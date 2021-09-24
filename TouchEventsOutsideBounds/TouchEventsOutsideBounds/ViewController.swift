//
//  ViewController.swift
//  TouchEventsOutsideBounds
//
//  Created by Pete Smith on 17/09/2021.
//

import UIKit

class ViewController: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = "No taps!"
        return label
    }()

    private lazy var containerView: ContainerView = {
        let containerView = ContainerView(withTapAction: self.didPressButton)
        containerView.backgroundColor = .systemYellow
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    private var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    @objc func didPressButton() {
        label.text = "Tap \(count)"
        count += 1
    }
}

private extension  ViewController {

    func setupUI() {

        view.backgroundColor = .black

        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true

        view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

