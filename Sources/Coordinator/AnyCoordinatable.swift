/// A type-erased `Coordinatable`.
public class AnyCoordinatable<InputType, OutputType> {

  /// A coordination handler of base coordinatable. It keeps reference to base coordinatable.
  private let coordination: (InputType, @escaping Completion<OutputType>) -> Void

  /// Initializes an any coordinatable.
  /// - Parameter coordinatable: A coordinatable on which this any coordinatable is based. 
  public init<C: Coordinatable>(_ coordinatable: C) where C.InputType == InputType, C.OutputType == OutputType {
    self.coordination = coordinatable.start
  }

}

extension AnyCoordinatable: Coordinatable {

  /// Starts coordination.
  /// - Parameters:
  ///   - input: A coordination input.
  ///   - completion: The block to execute after coordination finishes.
  public func start(with input: InputType, completion: @escaping Completion<OutputType>) {
    coordination(input, completion)
  }

}