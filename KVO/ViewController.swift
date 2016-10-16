//
//  ViewController.swift
//  KVO
//
//  Created by Bart Jacobs on 15/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var timeLabel: UILabel!

    // MARK: -

    let configurationManager = ConfigurationManager(withConfiguration: Configuration())

    // MARK: - Deinitialization

    deinit {
        removeObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt))
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old, .new, .initial], context: nil)
    }

    // MARK: - Actions

    @IBAction func updateConfiguration(sender: UIButton) {
        configurationManager.updateConfiguration()
    }

    // MARK: - Key-Value Observing

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
            // Update Time Label
            timeLabel.text = configurationManager.updatedAt
        }
    }

}
