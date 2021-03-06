/// Describes the main coordinating action.
public protocol Coordinating {

  /// Coordinates to the coordinatable.
  /// - Parameters:
  ///   - coordinatable: The coordinatable.
  ///   - input: The coordination input.
  ///   - completion: The block to execute after the coordination finishes.
  func coordinate<C: Coordinatable>(to coordinatable: C, with input: C.InputType, completion: CoordinatorCompletion<C.OutputType>?)

}

extension Coordinating {

  /// Coordinates to the coordinatable.
  /// - Parameters:
  ///   - coordinatable: The coordinatable.
  ///   - input: The coordination input.
  ///   - completion: The block to execute after the coordination finishes.
  func coordinate<C: Coordinatable>(to coordinatable: C, with input: C.InputType, completion: CoordinatorCompletion<C.OutputType>? = nil) {
    coordinate(to: coordinatable, with: input, completion: completion)
  }

  /// Coordinates to the coordinatable.
  /// - Parameters:
  ///   - coordinatable: The coordinatable.
  ///   - completion: The block to execute after the coordination finishes.
  public func coordinate<C: Coordinatable>(to coordinatable: C, completion: CoordinatorCompletion<C.OutputType>? = nil) where C.InputType == Void {
    coordinate(to: coordinatable, with: (), completion: completion)
  }

}
