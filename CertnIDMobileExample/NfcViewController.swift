//
//  NfcViewController.swift
//  CertnIDMobileExample
//
//  Created by Yuri Grigoriev on 13/08/2024.
//

import CertnIDMobileSDK
import UIKit

class NfcViewController: UIViewController {
    private let nfcKey: CertnIDNfcKey?
    private let nfcReader: CertnIDNfcTravelDocumentReader

    init() {
        self.nfcKey = try? CertnIDNfcKey(
            documentNumber: "PASTE DOCUMENT NUMBER HERE",
            dateOfExpiry: "PASTE DATE OF EXPIRY HERE",
            dateOfBirth: "PASTE DATE OF BIRTH HERE"
        )

        let authorityCertificatesUrl = Bundle.main.url(forResource: "authority_certificates", withExtension: "pem")
        let configuration = CertnIDNfcTravelDocumentReaderConfiguration(authorityCertificatesUrl: authorityCertificatesUrl)
        self.nfcReader = CertnIDNfcTravelDocumentReader(configuration: configuration)
        super.init(nibName: nil, bundle: nil)
        nfcReader.setDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }

    func start() {
        guard let nfcKey else {
            print("Failed to init NFC Key")
            return
        }

        nfcReader.read(
            nfcKey: nfcKey
        )
    }
}

extension NfcViewController: CertnIDNfcTravelDocumentReaderDelegate {
    func nfcTravelDocumentReader(
        _ nfcTravelDocumentReader: CertnIDMobileSDK.CertnIDNfcTravelDocumentReader,
        succeeded travelDocument: CertnIDMobileSDK.CertnIDTravelDocument
    ) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let encoded = try? encoder.encode(travelDocument) {
            print(String(data: encoded, encoding: .utf8) ?? "Failed to encode data")
        }
    }

    func nfcTravelDocumentReader(
        _ nfcTravelDocumentReader: CertnIDMobileSDK.CertnIDNfcTravelDocumentReader,
        failed error: String
    ) {
        print(error)
    }

    func nfcTravelDocumentReaderCanceled(
        _ nfcTravelDocumentReader: CertnIDMobileSDK.CertnIDNfcTravelDocumentReader
    ) {
        print("NOK")
    }
}
