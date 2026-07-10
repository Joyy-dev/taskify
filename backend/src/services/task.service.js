const taskRepository = require('../repositories/task.repository');

const PRIORITIES = [
    'low',
    'medium',
    'high'
];

class TaskService {
    async createTask(taskData) {
        this.validateTitle(taskData.title);
        this.validatePriority(taskData.priority);
        this.validateDueDate(taskData.dueDate);

        const task = {
            ...taskData,
            completed: false,
        };

        return await taskRepository.create(task);
    }

    validateTitle(title) {
        if(!title || title.trim() === '') {
            throw new Error('Title cannot be empty');
        }
    } 

    validatePriority(priority) {

        const normalizedPriority = priority.toLowerCase();

        if(!PRIORITIES.includes(normalizedPriority)) {
            throw new Error('Priority must be low, medium, or high');
        }
    }

    validateDueDate(dueDate) {
        if (!dueDate ) {
            return;
        }

        if(new Date(dueDate) < new Date()) {
            throw new Error('Due date cannot be in the past');
        }
    }

    async getUserTasks(userId) {
        return taskRepository.findByUserId(userId);
    }

    async getTaskById(taskId, userId) {
        const task = await taskRepository.findById(taskId);

        if(!task) {
            throw new Error('Task not found');
        }

        if (task.userId !== userId) {
            throw new Error('Forbidden');
        }

        return task;
    }

    async updateTask(taskId, userId, updates) {
        const task = await taskRepository.findById(taskId);

        if (!task) {
            throw new Error('Task not found');
        }

        if (task.userId !== userId) {
            throw new Error('Forbidden');
        }

        if (updates.title !== undefined) {
            this.validateTitle(updates.title);
        }

        if (updates.priority !== undefined) {
            this.validatePriority(updates.priority);
        }

        if (updates.dueDate !== undefined) {
            this.validateDueDate(updates.dueDate);
        }
        
        return await taskRepository.update(taskId, updates);
    }

    async deleteTask(taskId, userId) {
        const task = await taskRepository.findById(taskId);

        if (!task) {
            throw new Error('Task not found');
        }

        if (task.userId !== userId) {
            throw new Error ('Forbidden');
        }

        return await taskRepository.delete(taskId);
    }
}

module.exports = new TaskService();