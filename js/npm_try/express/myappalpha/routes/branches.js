var express = require('express');
var router = express.Router();
var handlers = require("../handlers/branches");


router.get('/status', function(req, res) {
  res.render('branches/status', { title: "branches status" , branchesStatus: handlers.getBranchesStatus(req) });
});


router
    .get('/edit', function(req, res) {
        console.log("router.branches.edit.get() has called");
        res.render('branches/edit', { title: "branches edit" });
    })
    .post('/edit', function(req, res) {
        console.log("router.branches.edit.post has called");
        res.render('branches/edit', { title: "branches edit" });
    });


    // res.redirect("/branches/status");
module.exports = router;

