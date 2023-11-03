//
//  AppCoordinator.swift
//  UIKit-Viper-Template
//
//  Created by Telem Tobi on 03/11/2023.
//

import UIKit

class AppCoordinator: Coordinator, MainScreenRouter {
    
    var window: UIWindow
    var interactable: Interactable
    var childCoordinators: [Coordinator] = []
    
    required init(window: UIWindow, interactable: Interactable) {
        self.window = window
        self.interactable = interactable
    }
    
    func start() {
        // TODO: Present mainScreen
    }
    
    func finish() {
        // Won't finish as its the root coordinator
        // parentCoordinator?.childDidFinish(self)
    }
    
    // MARK: - Main Screen
    
//    @MainActor
//    private var mainScreenView: MainViewController {
//        let interactor = MainScreenInteractor(interactable: interactable)
//        let view = MainScreenWireframe.makeView(interactor: interactor, router: self)
//        return view
//    }
}
