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
  func start(with input: InputType, completion: @escaping Completion<OutputType>)

}

extension Coordinatable where InputType == Void {

  /// Starts coordination.
  /// - Parameter completion: The block to execute after the coordination finishes.
  public func start(completion: @escaping Completion<OutputType>) {
    start(with: (), completion: completion)
  }

}