#!"C:\Program Files\nodejs\node"

const exec = require('child_process').exec

exec(`git show --stat --format='format:  Commit: %H
%D
  Author: %an
    Date: %ad

%B
' $(cat /dev/clipboard)`,function(error,stdout,stderr){
    console.log(error,stdout,stderr);
});