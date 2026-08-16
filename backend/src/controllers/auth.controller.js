const authService = require("../services/auth.service");

async function register(req, res) {
    try {
        const userData = req.body;

        const user = await authService.register(userData);
        return res.status(201).json({
            success: true,
            message: 'Account successfully created',
            data: user
        });
    } catch (e) {
        return res.status(409).json({
            success: false,
            message: e.message
        });
    }
}

async function login(req, res) {
    try {
        const userData = req.body;

        const user = await authService.login(userData);
        return res.status(200).json({
            success: true,
            message: 'Login successful!',
            data: user
        });
    } catch (e) {
        return res.status(401).json({
            success: false,
            message: e.message
        });
    }
    
}

async function welcome(req, res) {
    res.status(200).json({
        success: true,
        message: 'Welcome To Taskfiy API'
    });
}

module.exports = {
    register,
    login,
    welcome
};