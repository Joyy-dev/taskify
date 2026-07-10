const taskService = require('../services/task.service');

async function createTask(req, res) {
    try {
        const taskData = {
            userId: req.user.id,
            title: req.body.title,
            description: req.body.description,
            priority: req.body.priority,
            dueDate: req.body.dueDate
        }

        const task = await taskService.createTask(taskData);

        return res.status(201).json({
            success: true,
            message: 'Task successfully created',
            data: task
        })

    } catch (e) {
        return res.status(400).json({
            success: false,
            message: e.message
        })
    }
}

async function getUserTasks(req, res) {
    try {
        const getUserTask = await taskService.getUserTasks(req.user.id);

        return res.status(200).json({
            success: true,
            message: 'Task successfully retrieved',
            data: getUserTask
        })

    } catch(e) {
        return res.status(400).json({
            success: false,
            message: e.message
        })
    } 
}

async function getTask(req, res) {
    try {
        const getTask = await taskService.getTaskById(
            Number(req.params.id),
            req.user.id
        );

        return res.status(200).json({
            success: true,
            message: 'Task successfully retrieved',
            data: getTask
        })
    } catch(e) {
        return res.status(400).json({
            success: false,
            message: e.message
        })
    }
}

async function updateTask(req, res) {
    try {
        const updateTask = await taskService.updateTask(
            Number(req.params.id),
            req.user.id,
            req.body
        );

        return res.status(200).json({
            success: true,
            message: 'Task successfuly updated',
            data: updateTask
        });
    } catch(e) {
        return res.status(400).json({
            success: false,
            message: e.message
        })
    }
}

async function deleteTask(req, res) {
    try {
        const deleteTask = await taskService.deleteTask(
            Number(req.params.id),
            req.user.id
        );

        return res.status(200).json({
            success: true,
            message: 'Task successfully deleted'
        });
    } catch(e) {
        return res.status(400).json({
            success: false,
            message: e.message
        })
    }
    
}

module.exports = {
    createTask,
    getUserTasks,
    getTask,
    updateTask,
    deleteTask
}