import UIKit

class AppController {
    
    private let interactor: Interactor
    private let coordinator: AppCoordinator
    
    init(window: UIWindow) {
        let appData = AppData()
        let services = Services()
        let dataProviders = DataProviders(appData: appData)
        
        interactor = Interactor(appData: appData, services: services, dataProviders: dataProviders)
        coordinator = AppCoordinator(window: window, interactable: interactor)
    }
    
    func start() {
        coordinator.start()
    }
}
