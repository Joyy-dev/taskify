const taskRepository = require('../repositories/task.repository');

const PRIORITIES = [
    'low',
    'medium',
    'high'
];

class TaskService {
    async createTask(taskData) {
        this.validateTitle(taskData.title);
        
        if (taskData.priority != undefined) {
            taskData.priority = this.validatePriority(taskData.priority);
        }

        this.validateDueDate(taskData.dueDate);

        return await taskRepository.create(taskData);
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

        return normalizedPriority;
    }

    validateDueDate(dueDate) {
        if (!dueDate ) {
            throw new Error('Due date is required');
        }

        const date = new Date(dueDate)

        if (Number.isNaN(date.getTime())) {
            throw new Error('Invalid due date')
        }

        if( date < new Date()) {
            throw new Error('Due date cannot be in the past');
        }
    }

    validateCompleted(completed) {
        if (typeof completed !== 'boolean') {
            throw new Error('Completed must be true or false');
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
        const allowedUpdates = [
            'title',
            'description',
            'priority',
            'dueDate',
            'completed'
        ];

        if (!task) {
            throw new Error('Task not found');
        }

        if (task.userId !== userId) {
            throw new Error('Forbidden');
        }

        const cleanUpdates = Object.keys(updates).filter(
            key => allowedUpdates.includes(key)).reduce((obj, key) => {
                obj[key] = updates[key];
                return obj;
            }, {});

            if (Object.keys(cleanUpdates).length === 0) {
                throw new Error('No valid fields provided for update')
            }

            
            if (cleanUpdates.title !== undefined) {
                this.validateTitle(cleanUpdates.title);
            }

            if (cleanUpdates.priority !== undefined) {
                cleanUpdates.priority = this.validatePriority(cleanUpdates.priority);
            }

            if (cleanUpdates.dueDate !== undefined) {
                this.validateDueDate(cleanUpdates.dueDate);
            }

            if (cleanUpdates.completed !== undefined) {
                this.validateCompleted(cleanUpdates.completed);
            }
        
        return await taskRepository.update(taskId, cleanUpdates);
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