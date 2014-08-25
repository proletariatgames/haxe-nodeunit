/*!
 * haxe-nodeunit
 * Copyright (c) 2014 Proletariat Inc
 * MIT Licensed
 */
package nodeunit;

/**
 * Exposes the nodeunit test object's methods to haxe.
 */
extern class TestCase {
  /**
   * Tests if value is a true value.
   */
  @:overload(function(ok:Dynamic, message:Dynamic) : Void {})
  public function ok(ok:Dynamic) : Void;

  /**
   * Tests shallow, coercive equality with the equal comparison operator ( == ).
   */
  @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  public function equal(actual:Dynamic, expected:Dynamic) : Void;

  /**
   * Tests shallow, coercive non-equality with the not equal comparison operator ( != ).
   */
  @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  public function notEqual(actual:Dynamic, expected:Dynamic) : Void;

  /**
   * Tests for deep equality.
   */
  @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  public function deepEqual(actual:Dynamic, expected:Dynamic) : Void;

  /**
   * Tests for any deep inequality.
   */
  @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  public function notDeepEqual(actual:Dynamic, expected:Dynamic) : Void;

  /**
   * Tests strict equality, as determined by the strict equality operator ( === )
   */
  @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  public function strictEqual(actual:Dynamic, expected:Dynamic) : Void;

  /**
   * Tests strict non-equality, as determined by the strict not equal operator ( !== )
   */
  @:overload(function(actual:Dynamic, expected:Dynamic, message:Dynamic) : Void {})
  public function notStrictEqual(actual:Dynamic, expected:Dynamic) : Void;

  /**
   * Expects block to throw an error.
   */
  @:overload(function(block:Dynamic, error:Dynamic, message:Dynamic) : Void {})
  @:overload(function(block:Dynamic, error:Dynamic) : Void {})
  public function throws(block:Dynamic) : Void;

  /**
   * Expects block not to throw an error.
   */
  @:overload(function(block:Dynamic, error:Dynamic, message:Dynamic) : Void {})
  @:overload(function(block:Dynamic, error:Dynamic) : Void {})
  public function doesNotThrow(block:Dynamic) : Void;

  /**
   * Tests if value is not a false value, throws if it is a true value. Useful when testing the first argument, error in callbacks.
   */
  public function ifError(value:Dynamic) : Void;

  /**
   * Specify how many assertions are expected to run within a test. Very useful for ensuring that all your callbacks and assertions are run.
   */
  public function expect(amount:Int) : Void;

  /**
   * Finish the current test function, and move on to the next. ALL tests should call this!
   */
  public function done() : Void;
}
