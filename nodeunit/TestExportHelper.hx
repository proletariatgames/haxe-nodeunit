/*!
 * haxe-nodeunit
 * Copyright (c) 2014 Proletariat Inc
 * MIT Licensed
 */
package nodeunit;

import haxe.rtti.Meta;

/**
 * Helper code to inspect a class and form nodeunit-esq module exports. This class is used
 * internally by TestMain and TestSuite.
 */
class TestExportHelper {
  /**
   * Method to be called before each test in a class.
   */
  inline static var SETUP_FUNC_NAME:String = "setUp";

  /**
   * Method to be called after each test in a class.
   */
  inline static var TEARDOWN_FUNC_NAME:String = "tearDown";

  /**
   * Meta tag marking static test method in class.
   */
  inline static var TEST_META_TAG:String = "test";

  static function functionArguments(func:Dynamic) : Array<String> {
    var reg = ~/\(([\s\S]*?)\)/;
    var params = reg.match(func.toString());
    if (params && reg.matched(1).length > 0) {
       return reg.matched(1).split(',');
    }
    return [];
  }

  /**
   * Helper code to inspect a class and form nodeunit-esq module exports.
   */
   public static function exportSetupTeardown(exports:Dynamic, klass:Class<Dynamic>) : Void {
    for (funcName in [SETUP_FUNC_NAME, TEARDOWN_FUNC_NAME]) {
      var func = Reflect.field(klass, funcName);
      if (func != null) {
        if (functionArguments(func).length != 1) {
          throw 'Invalid arguments for ${Type.getClassName(klass)}.$funcName';
        }

        Reflect.setField(exports, funcName, func);
      }
    }
  }

  /**
   * Helper code to inspect a class and form nodeunit-esq module exports.
   */
  public static function exportTests(klass:Class<Dynamic>) : Dynamic {
    var tests:Dynamic = {};
    exportSetupTeardown(tests, klass);

    var meta = Meta.getStatics(klass);
    var fieldNames = Reflect.fields(meta);
    for (fieldName in fieldNames) {
      var func:Dynamic = Reflect.field(klass, fieldName);
      var funcMeta:Dynamic = Reflect.field(meta, fieldName);
      if (!Reflect.isFunction(func) || !Reflect.hasField(funcMeta, TEST_META_TAG)) {
        continue;
      }

      switch(functionArguments(func).length) {
        case 1:
          Reflect.setField(tests, fieldName, function(test:TestCase) { func(test); test.done(); });

        case 2:
          Reflect.setField(tests, fieldName, function(test:TestCase) { func(test, test.done); });

        case _:
          throw 'Invalid arguments for test $fieldName';
      }
    }

    return tests;
  }
}
