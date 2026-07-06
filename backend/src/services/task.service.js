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

        if(!PRIORITIES.includes(priority)) {
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
}

module.exports = new TaskService();