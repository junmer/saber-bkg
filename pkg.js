#!/usr/bin/env node

/**
 * @file pkg to bower
 */

function extend (object) {
    // Takes an unlimited number of extenders.
    var args = Array.prototype.slice.call(arguments, 1);

    // For each extender, copy their properties on our object.
    for (var i = 0, source; source = args[i]; i++) {
        if (!source) continue;
        for (var property in source) {
            object[property] = source[property];
        }
    }

    return object;
}


var path = require('path');

var bosePkg = require(path.resolve(__dirname, 'base.json'));

var cwd = process.cwd();

var filePath = path.resolve(cwd, 'package.json');

var pkg = require(filePath);

var bowerPath = path.resolve(cwd, 'bower.json');

var bowerPkg = extend({}, pkg, bosePkg);

delete bowerPkg.scripts;

require('fs').writeFileSync(bowerPath, JSON.stringify(bowerPkg, null, 2));
