/*!
 * haxe-nodeunit
 * Copyright (c) 2014 Proletariat Inc
 * MIT Licensed
 */
import nodeunit.TestCase;

import js.Node;

class ExampleTests implements ExampleAsync {

  static var foo:String;
  @async static function setUp() : Void {
    foo = 'bar';
  }

  @test static function testSomething(test:TestCase) : Void {
    test.expect(1);
    test.ok(true, "this assertion should pass");
  }

  @test @async static function testSomethingAsync(test:TestCase) : Void {
    @await Node.setImmediate();

    test.expect(1);
    test.ok(true, "this assertion should pass");
  }

  @test static function testSetUp(test:TestCase) : Void {
    test.equal(foo, 'bar');
  }
}
