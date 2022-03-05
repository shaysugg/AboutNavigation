# About Navigations
## What is this?
This is a sample project that try to demonstrate a router system of VIPER architecture by using a simple router system that mentioned [here](https://www.swiftbysundell.com/articles/navigation-in-swift/), and see if this system would scale well in big projects or not.

## What this Sample project do
user sign in or register, can browse collection of items and see their details and also can go to setting to see more info or logout. all the navigations done by using independent classes that ViewControllers are in contact to. 

## What this Sample project has
Mostly focused on `ViewControllers` and `Routers`. All module that defined can be grouped as:
 * ViewControllers
 * ViewController Factories: handles dependencies of ViewControllers
 * Navigators: Handling routing, each ViewController that need a routing system should have one Navigator
 * Modules: Core classes, currently an auth manager
 * API: services that implemented based on external systems. Currently, deep link handlers
 * Data

 ## How the Navigators are implemented
 based on [this article](https://www.swiftbysundell.com/articles/navigation-in-swift/). All of them should conform to this protocol.
  ```swift
  protocol Navigator {
    associatedtype NavigatorDestination
    
    func go(to destination: NavigatorDestination)
}
  ```
### Initial Navigator
This is where the root view controller of the app getting configured. It uses multiple systems to configure that.
Its destinations all conform to `InitialVCDestination` which they would define their destination view controllers individually.
Initial Navigator based on the situation of app systems decide and pick one of the destinations.

### DeepLink Destination
One of the initial navigator destinations is `InitialVCDestinationDeepLink`. It gets a `DeepLinkDestination` which is an abstraction that has one or multiple ViewControllers.
`ServerDeppLinkDestination` is an implementation of it that depends on our external system that provides deeplink information through a URL. ServerDeppLinkDestination parse the URL and by helping of `ServerDeepLinkNameResolver` turn them to an array of ViewControllers.