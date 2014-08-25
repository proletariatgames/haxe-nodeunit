/*!
 * haxe-nodeunit
 * Copyright (c) 2014 Proletariat Inc
 * MIT Licensed
 */
import com.dongxiguo.continuation.Continuation;
import haxe.macro.Context;
import haxe.macro.Expr;

/**
 * Implement this interface as a shortcut to having the Continuation code run against @async macros
 */
@:autoBuild(ExampleAsyncBuild.build())
interface ExampleAsync {
}

class ExampleAsyncBuild {
  #if macro
  public static macro function build() : Array<Field> {
    var bf = Context.getBuildFields();
    return Continuation.cpsByMetaFields("async", bf);
  }
  #end
}
