//
//  
//  MainScreenViewController.swift
//  UIKit-Viper-Template
//
//  Created by Telem Tobi on 03/11/2023.
//
//


import UIKit

class MainScreenViewController: UIViewController {
    
    private var presenter: MainScreenPresenter!

    func set(_ presenter: MainScreenPresenter) {
        self.presenter = presenter
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension MainScreenViewController: MainScreenViewable {
    
}
