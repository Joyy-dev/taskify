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
        if (e.message === 'Title is required') {

            return res.status(400).json({
                success: false,
                message: e.message
            })
        }
    }
}

module.exports = {
    createTask
}