var someFunction = function () {
    return "someFunction";
}

var fs = require( "fs" );
fs.exists( "index.js", function() {
    fs.readFile( "index.js", "utf8", function( err, contents ) {
        contents = someFunction( contents ); // do something with contents
        fs.writeFile( "index.js", contents, function() {
            console.log( "whew! Done finally..." );
        });
    });
});
console.log( "executing..." );