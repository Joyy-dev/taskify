const tasks = [];

class TaskRepository {
    async findById(id) {
        return tasks.find(task => task.id === id) ?? null;
    }

    async findByUserId(userId) {
        return tasks.filter(task => task.userId === userId);
    }

    async create(task) {
        const newTask = {
            id: tasks.length + 1,
            ...task 
        };
        tasks.push(newTask);
        return newTask;
    }

    async update(id, updates) {
        const taskIndex = tasks.findIndex(task => task.id === id);

        if (taskIndex === -1) {
            return null;
        }

        tasks[taskIndex] = {
            ...tasks[taskIndex], 
            ...updates 
        };
        return tasks[taskIndex];
    }

    async delete(id) {
        const taskIndex = tasks.findIndex(task => task.id === id);

        if (taskIndex === -1) {
            return null;
        }

        return tasks.splice(taskIndex, 1)[0];
    }
}

module.exports = new TaskRepository();