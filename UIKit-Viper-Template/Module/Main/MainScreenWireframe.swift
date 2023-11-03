//
//  
//  MainScreenWireframe.swift
//  UIKit-Viper-Template
//
//  Created by Telem Tobi on 03/11/2023.
//
//


import UIKit

class MainScreenWireframe {
    
    static func makeViewController() -> MainScreenViewController {
        let identifier = String(describing: MainScreenViewController.self)
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? MainScreenViewController else {
            fatalError("View controller with identifier: \(identifier) not found")
        }
        
        return viewController
    }
    
    static func prepare(_ viewController: MainScreenViewController, interactor: MainScreenInteractor, router: MainScreenRouter?) {
        let presenter = MainScreenPresenter(interactor: interactor, router: router, view: viewController)
        viewController.set(presenter)
    }
}
