//
//  ViewController.swift
//  CertnIDMobileExample
//
//  Created by Yuri Grigoriev on 02/07/2024.
//

import UIKit

class ViewController: UIViewController {
    private lazy var documentAutoCaptureButton: UIButton = {
        let button = UIButton()
        button.setTitle("main.screen.document.button".localized, for: .normal)
        button.addTarget(self, action: #selector(showDocumentAutoCapture), for: .touchUpInside)
        return button
    }()

    private lazy var faceCaptureButton: UIButton = {
        let button = UIButton()
        button.setTitle("main.screen.face.button".localized, for: .normal)
        button.addTarget(self, action: #selector(showFaceCapture), for: .touchUpInside)
        return button
    }()

    private lazy var nfcButton: UIButton = {
        let button = UIButton()
        button.setTitle("main.screen.nfc.button".localized, for: .normal)
        button.addTarget(self, action: #selector(showNfc), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        let stackView = UIStackView(arrangedSubviews: [documentAutoCaptureButton, faceCaptureButton, nfcButton])
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func showDocumentAutoCapture() {
        let viewController = DocumentAutoCaptureViewController()
        present(viewController, animated: true)
    }

    @objc private func showFaceCapture() {
        let viewController = FaceCaptureViewController()
        present(viewController, animated: true)
    }

    @objc private func showNfc() {
        let viewController = NfcViewController()
        present(viewController, animated: true)
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
