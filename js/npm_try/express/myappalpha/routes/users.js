var express = require('express');
var router = express.Router();

/* GET users listing. */
router.all('/', function(req, res) {
  // res.send('respond with a resource');
  res.send(req.body.user_name);
  res.send("res");
});

module.exports = router;
