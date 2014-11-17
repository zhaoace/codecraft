var querystring =  require("querystring"),
    fs = require("fs");


var branchesStatus  = [
        {"name": "master", "owner": "scm", "from": "N/A"},
        {"name": "zhaoli", "owner": "zhaoli", "from": "master"},
        {"name": "feat_50", "owner": "scm", "from": "feat_50"},
        {"name": "feat_big", "owner": "fa", "from": "feat_50"},
        {"name": "feat_tea", "owner": "sa", "from": "master"}
     ] ;


function start (response) {
    console.log("Request handler 'start' was called. ");
}

function getBranchesStatus (req) {
    return branchesStatus;
}


exports.start = start;
exports.getBranchesStatus = getBranchesStatus;

