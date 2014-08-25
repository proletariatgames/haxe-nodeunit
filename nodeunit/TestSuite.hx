/*!
 * haxe-nodeunit
 * Copyright (c) 2014 Proletariat Inc
 * MIT Licensed
 */
package nodeunit;

/**
 * Extend this class and add your tests. Use this purely to help organize your tests.
 */
class TestSuite {
  /**
   * The suite's exports organized as nodeunit expects them
   */
  public var exports(default, null) : Dynamic;

  /**
   * Overload this constructor and add your Test classes w/ add
   */
  public function new() {
    this.exports = {}
    TestExportHelper.exportSetupTeardown(this.exports, Type.getClass(this));
  }

  /**
   * Adds a classes static methods as tests within this suite
   */
  public function add(klass:Class<Dynamic>) {
    var name = Type.getClassName(klass);
    var tests = TestExportHelper.exportTests(klass);
    Reflect.setField(this.exports, name, tests);
  }
}
