const express = require('express');
const { welcome, register } = require('../controllers/auth.controller');
const router = express.Router();

router.get('/', welcome);
router.post('/register', register);

module.exports = router;