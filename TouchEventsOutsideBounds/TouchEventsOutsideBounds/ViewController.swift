//
//  ViewController.swift
//  TouchEventsOutsideBounds
//
//  Created by Pete Smith on 17/09/2021.
//

import UIKit

class ViewController: UIViewController {

    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private var containerView: ContainerView = {
        let containerView = ContainerView()
        containerView.backgroundColor = .systemYellow
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemCyan
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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

        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)

        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true

        containerView.addSubview(button)
        button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true

        view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

