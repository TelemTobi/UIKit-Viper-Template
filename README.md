# UIKit Viper Template

A comprehensive project template featuring the Viper architecture, Coordinator pattern, and Networking components all set up for you.<br/>
In addition, you'll benefit from a collection of useful extensions, protocols, and a demo module to kickstart your project.

For an even faster module creation compatible with this architecture, check out the [Viper Module Xcode Template](https://github.com/TelemTobi/Viper-Module-Xcode-Template.git).

<br/>

## Understanding the Architecture

This template follows the Viper architecture and includes the following key components:

### AppController
The **AppController** serves as the root component of your app. It takes care of initializing the core components and the app itself. Moreover, it handles app-specific logic, including tasks like managing deep links.

### AppCoordinator
The **AppCoordinator** conforms to the `Coordinator` protocol and is responsible for managing the initial app navigation and launching other flows. This component remains free of any business logic, focusing solely on navigation.

### AppData
**AppData** is an `ObservableObject` that holds data accessible throughout your entire project. To achieve reactivity, consider using `@Published` properties within this object.

### Services
The **Services** class houses all the services your app provides, which are accessible through the `Interactor`. These services handle device-specific operations, such as managing contacts, bluetooth, or notifications.

### Interactor
The **Interactor** has access to `AppData`, `Services`, and `DataProviders`. Every module you create utilizes this component to interact with the external world.

<br/>

## Navigation with the Coordinator Pattern

The Coordinator pattern is a widely used design pattern in Swift/iOS applications that facilitates the management of navigation and view flow within an app.<br/>
The main idea behind this pattern is to decouple the navigation logic from the views, thereby making it easier to maintain and extend the application over time.
<br/><br/>
The `Coordinator` protocol, which all coordinators must conform to, is defined as follows:
```swift
protocol Coordinator: AnyObject {
    
    var window: UIWindow { get }
    var interactable: Interactable { get set }
    var childCoordinators: [Coordinator] { get set }
    
    init(window: UIWindow, interactable: Interactable)

    func start()
    func finish()
    func didTapCloseButton()
    func didTapBackButton()
}

```
- `window` is essential for performing actions related to the app's window, such as initializing the rootViewController.
- `Interactable` is a protocol that the Interactor conforms to, exposing only the relevant elements to the modules.
- `childCoordinators` is an array of coordinators, maintaining references to each sub-coordinator initialized by the current coordinator.<br/><br/>
- `start()` method initiates the flow by presenting the initial ViewController, often embedded within a NavigationController.
- `finish()` method should be called when the flow is completed. Be sure to call **childDidFinish** on the **parentCoordinator** to prevent memory leaks.
- `didTapCloseButton()` handles the action when a close button is tapped and should conclude the flow.
- `didTapBackButton()` handles the action when a back button is tapped and should navigate back to the previous ViewController.

**The Coordinator protocol also includes several convenient methods with default implementations.<br/>
Be sure to explore them for additional insights and efficiency!**
<br/><br/>
Your project can incorporate as many coordinators as needed, with each coordinator managing a complete flow within your application.

<br/>

## Networking

The networking layer in this template harnesses the power of the Moya package.<br/>
The fundamental concept behind Moya is to provide a network abstraction layer that effectively encapsulates the direct invocation of Alamofire. It aims to be simple for common tasks yet comprehensive enough to handle more intricate scenarios.

Key Features of Moya:

- Compile-time checking for correct API endpoint accesses.
- Clear definition of different endpoints with associated enum values.
- First-class treatment of test stubs for seamless unit testing.

<br/>

### EndPoints
Each networking API has its dedicated Endpoints file, defining request requirements such as base URL, path, HTTP method, headers, query parameters, body, and more.<br/>
The **Endpoints** enum should conform to `TargetTypeEndPoint` for additional decoding strategies and stubbing options.

### DataProvider
For each `Endpoints` file, there should be a corresponding **DataProvider** file that accesses the `NetworkManager` and makes requests with all relevant endpoints.<br/>
The **DataProvider** also has access to the `AppData` in case any app-related data needs updating.

### Authenticator
The **Authenticator** class conforms to the `Authentication` protocol, defined as follows:
```swift
protocol Authenticating {
    var accessKey: String? { get }
    var authState: AuthState { get }

    // Can be used to asynchronously authenticate the user
    func authenticate(with completion: @escaping SuccessCompletion) throws
    
    // Can be used to map the endpoint right before the request is excecuted
    func mapEndpoint(_ endpoint: Endpoint, for target: TargetTypeEndPoint) -> Endpoint
}
```
Feel free to customize the protocol to suit the needs of the API you're consuming.<br/>
The `mapEndpoints` method can be used to modify the request, such as adding global headers, for example.

### JsonResolver
Every response struct we decode should conform to the **JsonResolver** protocol or a sub-protocol overriding the default resolve implementation.<br/>
The protocol is defined as follows:
```swift
protocol JsonResolver {
    static func resolve(_ data: Data) throws -> Data
}

extension JsonResolver {
    static func resolve(_ data: Data) throws -> Data { data }
}
```
The resolver provides a way to modify our response JSON before it's decoded into our model, allowing us to manipulate the data to fit our needs.

### NetworkManager
The **NetworkManager** is where the heavy lifting of networking occurs. It houses the `Authenticator` and a `MoyaProvider` to perform requests.<br/>
The primary method we interact with is the `request` method:
```swift
func request<T, F: Errorable>(_ endpoint: EndPoint, completion: @escaping (Result<T, F>) -> Void) where T: Decodable, T: JsonResolver
```
This method accepts an `EndPoint` to build the request and a completion handler to call when the request completes.<br/>
The response type should conform to `Decodable` and `JsonResolver`, and the error type should conform to `Errorable`.
