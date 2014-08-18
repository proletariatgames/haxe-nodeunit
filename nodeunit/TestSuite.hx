package nodeunit;

class TestSuite {
  public var exports(default, null) : Dynamic;
  public function new() {
    this.exports = {}

    TestExportHelper.exportSetupTeardown(this.exports, Type.getClass(this));
  }

  public function add(klass:Class<Dynamic>) {
    var name = Type.getClassName(klass);
    var tests = TestExportHelper.exportTests(klass);
    Reflect.setField(this.exports, name, tests);
  }
}
