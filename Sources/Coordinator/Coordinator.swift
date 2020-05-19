/// Implements base features of coordinators.
open class Coordinator {

  /// References to child coordinatables.
  private var coordinatables = [ObjectIdentifier: AnyObject]()

}

extension Coordinator: Coordinating {

  /// Coordinates to the coordinatable.
  /// - Parameters:
  ///   - coordinatable: The coordinatable.
  ///   - input: The coordination input.
  ///   - completion: The block to execute after the coordination finishes.
  public func coordinate<C: Coordinatable>(to coordinatable: C, with input: C.InputType, completion: @escaping CoordinatorCompletion<C.OutputType>) {

    // Make a key for the coordinatable.
    let key = ObjectIdentifier(coordinatable)

    // Keep a reference to the coordinatable.
    coordinatables[key] = coordinatable

    // Start coordination.
    coordinatable.start(with: input) { [unowned self] result in

      // Remove a reference to the coordinatable.
      self.coordinatables[key] = nil

      // Call a completion block with result.
      completion(result)
    }
  }

}
