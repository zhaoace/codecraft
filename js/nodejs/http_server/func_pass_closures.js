
function execute( someFunction ,  value) {
    someFunction(value);
}

execute(  function say(word){ console.log(word);}   , "hello");
