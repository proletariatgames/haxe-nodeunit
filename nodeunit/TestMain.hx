package nodeunit;

import js.Node;

class TestMain {

  static var s_exports:Dynamic;
  static var s_sourceMap:Dynamic;

  public function new() {}

  public function initMain(klass:Class<TestMain>) {
    s_exports = untyped __js__('exports');

    var fields = Reflect.fields(s_exports);
    for (f in fields) {
      Reflect.deleteField(s_exports, f);
    }

    TestExportHelper.exportSetupTeardown(s_exports, klass);
  }

  public function addSuite(klass:Class<TestSuite>) {
    var name = Type.getClassName(klass);
    var suite = Type.createInstance(klass, []);
    Reflect.setField(s_exports, name, suite.exports);
  }

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
