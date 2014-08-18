package nodeunit;

extern class TestCase {

  // - Tests if value is a true value.
  @:overload(function(ok:Dynamic, message:Dynamic) : Void {})
  public function ok(ok:Dynamic) : Void;

  // - Tests shallow, coercive equality with the equal comparison operator ( == ).
  // @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  // public function equal(actual:Dynamic, expected:Dynamic) : Void;

  // - Tests shallow, coercive non-equality with the not equal comparison operator ( != ).
  // @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  // public function notEqual(actual:Dynamic, expected:Dynamic) : Void;

  // - Tests for deep equality.
  // deepEqual(actual, expected, [message])

  // - Tests for any deep inequality.
  // notDeepEqual(actual, expected, [message])

  // - Tests strict equality, as determined by the strict equality operator ( === )
  @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  public function strictEqual(actual:Dynamic, expected:Dynamic) : Void;

  // - Tests strict non-equality, as determined by the strict not equal operator ( !== )
  @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  public function notStrictEqual(actual:Dynamic, expected:Dynamic) : Void;

  // - Expects block to throw an error.
  @:overload(function(block:Dynamic, error:Dynamic, message:Dynamic) : Void {})
  @:overload(function(block:Dynamic, error:Dynamic) : Void {})
  public function throws(block:Dynamic) : Void;

  // - Expects block not to throw an error.
  // doesNotThrow(block, [error], [message]) 

  // - Tests if value is not a false value, throws if it is a true value. Useful when testing the first argument, error in callbacks.
  // ifError(value)

  // - Specify how many assertions are expected to run within a test. Very useful for ensuring that all your callbacks and assertions are run.
  public function expect(amount:Int) : Void; 

  // - Finish the current test function, and move on to the next. ALL tests should call this!
  public function done() : Void;
}
