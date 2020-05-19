/// Describes the main coordination action.
/// Defines as class-only because coordinators keeps the references to child coordinatables using key as `ObjectIdentifier`.
public protocol Coordinatable: class {

  /// The coordination input type.
  associatedtype InputType

  /// The coordination output type.
  associatedtype OutputType

  /// Starts coordination.
  /// - Parameters:
  ///   - input: The coordination input.
  ///   - completion: The block to execute after the coordination finishes.
  func start(with input: InputType, completion: CoordinatorCompletion<OutputType>?)

}

extension Coordinatable {

  /// Starts coordination.
  /// - Parameters:
  ///   - input: The coordination input.
  ///   - completion: The block to execute after the coordination finishes.
  func start(with input: InputType, completion: CoordinatorCompletion<OutputType>? = nil) {
    start(with: input, completion: completion)
  }

}

extension Coordinatable where InputType == Void {

  /// Starts coordination.
  /// - Parameter completion: The block to execute after the coordination finishes.
  public func start(completion: CoordinatorCompletion<OutputType>? = nil) {
    start(with: (), completion: completion)
  }

}