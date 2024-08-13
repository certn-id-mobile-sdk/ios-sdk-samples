//
//  DocumentAutoCaptureViewController.swift
//  CertnIDMobileExample
//
//  Created by Yuri Grigoriev on 13/08/2024.
//

import CertnIDMobileSDK
import UIKit

class DocumentAutoCaptureViewController: UIViewController {
    let viewController = CertnIDDocumentAutoCaptureViewController(configuration: .init(), style: .init())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        viewController.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewController.start()
    }

    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension DocumentAutoCaptureViewController: CertnIDDocumentAutoCaptureDelegate {
    func documentAutoCaptureViewController(_ viewController: CertnIDMobileSDK.CertnIDDocumentAutoCaptureViewController, captured result: CertnIDMobileSDK.CertnIDDocumentAutoCaptureResult) {
        // Stop document capture
        viewController.stopAsync {
        // Process the result here
        }
    }
}
