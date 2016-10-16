//
//  ConfigurationManager.swift
//  KVO
//
//  Created by Bart Jacobs on 15/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {

    // MARK: - Properties

    var configuration: Configuration

    // MARK: -

    lazy private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return dateFormatter
    }()

    // MARK: -

    var createdAt: String {
        return dateFormatter.string(from: configuration.createdAt)
    }

    var updatedAt: String {
        return dateFormatter.string(from: configuration.updatedAt)
    }

    // MARK: - Initialization

    init(withConfiguration configuration: Configuration) {
        self.configuration = configuration

        super.init()
    }

    // MARK: - Public Interface

    func updateConfiguration() {
        configuration.updatedAt = Date()
    }

}
