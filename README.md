# Coordinator

A package that provides helpful stuff for coordinator pattern.

## Usage

See sources or examples for more usage information.

### Factory of Coordinators

You can use a type-erased `AnyCoordinatable` for factories.

```swift
protocol CoordinatorFactoring {
  func makeAppCoordinator(router: Router) -> AnyCoordinatable<Void, Void>
  func makeFooCoordinator(router: Router) -> AnyCoordinatable<FooCoordinatorInput, FooCoordinatorOutput>
  func makeBarCoordinator(router: Router) -> AnyCoordinatable<BarCoordinatorInput, BarCoordinatorOutput>
}

final class CoordiatorFactory {
  // Fields with services here.
  // Initializer for services is here too.
}

extension CoordiatorFactory: CoordinatorFactoring {

  func makeAppCoordinator(router: Router) -> AnyCoordinatable<Void, Void> {
    .init(AppCoordinator(router: Router, factory: self))
  }

  func makeFooCoordinator(router: Router) -> AnyCoordinatable<FooCoordinatorInput, FooCoordinatorOutput> {
    .init(FooCoordinator(router: router, factory: self, aService: aService))
  }

  func makeBarCoordinator(router: Router) -> AnyCoordinatable<BarCoordinatorInput, BarCoordinatorOutput> {
    .init(BarCoordinator(router: router, factory: self, bService: bService))
  }

}
```

### Coordinators

Use `coordinate` method inside coordinator to coordinate child coordinators.

```swift
final class AppCoordinator: Coordinator {
  // Fields with services here.
  // Initializer for services is here too.
}

extension AppCoordinator: Coordinatable {

  func start(with _: Void, completion: @escaping CoordinatorCompletion<Void>) {
    if authService.isAuthorized {
      startMain()
    } else {
      startAuth()
    }
  }

  private func startMain() {

    // Define the tabbar controller.
    let tabBarController = UITabBarController()

    // Replace the root view controller with the tabbar controller.
    router.set(tabBarController, animated: true)

    // Start coordination of the main screen.
    coordinate(to: factory.makeMainCoordinator(router: tabBarController)) { _ in }
  }

  private func startAuth() {

    // Define the navigation controller.
    let navigationController = UINavigationController()

    // Replace the root view controller with the navigation controller.
    router.set(navigationController, animated: true)

    // Start coordination of the auth screen.
    coordinate(to: factory.makeAuthCoordinator(router: navigationController)) { [unowned self] _ in
      self.startMain()
    }
  }

}
```

## Requirements

* Xcode 11.4
* Swift 5.2

## Installation

Coming soon.