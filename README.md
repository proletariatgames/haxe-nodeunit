haxe-nodeunit
=================

This is a haxe wrapper for generating [nodeunit](https://github.com/caolan/nodeunit)
compatible unit tests.

## Installation

I have uploaded haxe-nodeunit on [haxelib](http://lib.haxe.org/p/nodeunit).
To install, type the following command in shell:

    haxelib install nodeunit

I would also recommend using the [continuation](http://lib.haxe.org/p/continuation) haxelib.

    haxelib install continuation

The easiest way to get running is to install nodeunit globally

    npm install -g nodeunit

And install source-map-support whereever you'll run your tests from

    cd example && npm install source-map-support

Then you can run test like this

    cd example && haxe build.hxml && nodeunit test.js

