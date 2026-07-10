const express = require('express');
const { createTask, getUserTasks, getTask, updateTask, deleteTask } = require('../controllers/task.contoller');
const authMiddleware = require('../middlewares/auth.middleware');
const router = express.Router();

router.post(
    '/tasks', 
    authMiddleware,
    createTask
);

router.get(
    '/tasks',
    authMiddleware,
    getUserTasks
);

router.get(
    '/tasks/:id',
    authMiddleware,
    getTask
);

router.patch(
    '/tasks/:id',
    authMiddleware,
    updateTask
);

router.delete(
    '/tasks/:id',
    authMiddleware,
    deleteTask
)

module.exports = router;