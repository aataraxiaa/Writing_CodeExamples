//
//  ContainerView.swift
//  TouchEventsOutsideBounds
//
//  Created by Pete Smith on 17/09/2021.
//

import UIKit

class ContainerView: UIView {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemCyan
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        return button
    }()

    private var tapAction: () -> Void

    init(withTapAction tapAction: @escaping () -> Void) {
        self.tapAction = tapAction
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let convertedPoint = button.convert(point, from: self)
        return button.point(inside: convertedPoint, with: event)
    }

    @objc func didPressButton() {
        tapAction()
    }
}

private extension ContainerView {

    func setupUI() {
        self.addSubview(button)
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
