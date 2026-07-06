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
}

module.exports = new TaskRepository();