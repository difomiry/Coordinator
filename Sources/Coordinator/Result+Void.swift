extension Result where Success == Void {

  /// A success.
  public static var success: Self {
    .success(())
  }

}
