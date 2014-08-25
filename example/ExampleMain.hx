/*!
 * haxe-nodeunit
 * Copyright (c) 2014 Proletariat Inc
 * MIT Licensed
 */
import nodeunit.TestMain;
import js.Node;

class ExampleMain extends TestMain implements ExampleAsync {
  static function main() {
    var main = new ExampleMain();
    main.installSourceMap();
    main.initMain(ExampleMain);
    main.addSuite(ExampleSuite);
  }

  @async static function setUp() : Void {
    @await Node.setImmediate();
  }
}
