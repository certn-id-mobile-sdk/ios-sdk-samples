//
//  FaceCaptureViewController.swift
//  CertnIDMobileExample
//
//  Created by Yuri Grigoriev on 13/08/2024.
//

import CertnIDMobileSDK
import UIKit

class FaceCaptureViewController: UIViewController {
    fileprivate let viewController = CertnIDFaceAutoCaptureViewController(configuration: .init(), style: .init())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewController.start()
    }

    private func setupSubviews() {
        view.backgroundColor = UIColor.systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        viewController.delegate = self
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)

        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension FaceCaptureViewController: CertnIDFaceAutoCaptureViewControllerDelegate {
    func faceAutoCaptureViewController(
        _ viewController: CertnIDMobileSDK.CertnIDFaceAutoCaptureViewController,
        captured result: CertnIDMobileSDK.CertnIDFaceAutoCaptureResult
    ) {
        viewController.stopAsync {
//            Process result
        }
    }
}
