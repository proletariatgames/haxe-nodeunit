/*!
 * haxe-nodeunit
 * Copyright (c) 2014 Proletariat Inc
 * MIT Licensed
 */
import nodeunit.TestSuite;

class ExampleSuite extends TestSuite {
  public function new() {
    super();
    add(ExampleTests);
  }
}
