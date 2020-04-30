var express = require('express');
var router = express.Router();

var endpoints = require('express-list-endpoints');

/* GET home page. */
router.get('/', function(req, res, next) {

  console.log('Traash back Endpoints : ');
  console.log(endpoints(req.app));

  res.render('index', { title: 'Traash EndPoints', endpoints: endpoints(req.app)});
});

module.exports = router;
