import Foundation

protocol MainScreenViewable: AnyObject {
    
}

class MainScreenPresenter {
    
    // MARK: - Properties
    
    private let interactor: MainScreenInteractable
    private weak var router: MainScreenRouter?
    private weak var view: MainScreenViewable?

    // MARK: - Initialiser
    
    init(interactor: MainScreenInteractable, router: MainScreenRouter?, view: MainScreenViewable) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    // MARK: - Methods
    
    func viewDidLoad() {
        
    }
}
