/*!
 * haxe-nodeunit
 * Copyright (c) 2014 Proletariat Inc
 * MIT Licensed
 */
package nodeunit;

import js.Node;

/**
 * Removes any conflicting @:expose settings, and exposes Tests / Suites for use by nodeunit
 */
class TestMain {
  static var s_exports:Dynamic;
  static var s_sourceMap:Dynamic;

  public function new() {}

  /**
   * Removes any conflicting @:expose settings, prepares exports for adding suites. Call this
   * first!
   */
  public function initMain(klass:Class<TestMain>) {
    s_exports = untyped __js__('exports');

    var fields = Reflect.fields(s_exports);
    for (f in fields) {
      Reflect.deleteField(s_exports, f);
    }

    TestExportHelper.exportSetupTeardown(s_exports, klass);
  }

  /**
   * Instantiates the suite, collects the exports for nodeunit
   */
  public function addSuite(klass:Class<TestSuite>) {
    if (s_exports == null) {
      throw 'initMain has not been called.';
    }

    var name = Type.getClassName(klass);
    var suite = Type.createInstance(klass, []);
    Reflect.setField(s_exports, name, suite.exports);
  }

  /**
   * Loads the source map, so that callstacks have the proper haxe filename and linenumber
   */
  public function installSourceMap() : Void {
    var map = '${Node.__filename}.map';
    if (Node.fs.existsSync(map)) {
      function resolveMapFile() : String {
        if (s_sourceMap == null) {
          var data = Node.fs.readFileSync(map, 'utf8');
          if (data != null) {
            s_sourceMap = {map: data};
          }
        }
        return s_sourceMap;
      };

      Node.require("source-map-support").install({retrieveSourceMap: resolveMapFile});
    }
  }
}
