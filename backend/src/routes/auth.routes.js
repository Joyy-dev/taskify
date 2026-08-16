const express = require('express');
const { welcome, register, login } = require('../controllers/auth.controller');
const router = express.Router();

router.get('/', welcome);
router.post('/register', register);
router.post('/login', login);

module.exports = router;