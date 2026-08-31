const express = require('express');
const { createTask, getUserTasks, getTask, updateTask, deleteTask } = require('../controllers/task.controller');
const authMiddleware = require('../middlewares/auth.middleware');
const router = express.Router();

router.post(
    '/', 
    authMiddleware,
    createTask
);

router.get(
    '/',
    authMiddleware,
    getUserTasks
);

router.get(
    '/:id',
    authMiddleware,
    getTask
);

router.patch(
    '/:id',
    authMiddleware,
    updateTask
);

router.delete(
    '/:id',
    authMiddleware,
    deleteTask
)

module.exports = router;