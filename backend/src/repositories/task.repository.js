const pool = require("../config/database");

class TaskRepository {
    async findById(id) {
        const result = await pool.query(
            `
            SELECT *
            FROM tasks
            WHERE id = $1
            `,
            [id]
        )
        return result.rows[0] ?? null;
    }

    async findByUserId(userId) {
        const result = await pool.query(
            `
            SELECT *
            FROM tasks
            WHERE user_id = $1
            `,
            [userId]
        )
        return result.rows
    }

    async create(task) {
        const newTask = await pool.query(
            `
            INSERT INTO tasks(user_id, title, description, priority, due_date, completed)
            VALUES($1, $2, $3, $4, $5, $6)
            RETURNING *;
            `,
            [task.userId, task.title, task.description, task.priority, task.dueDate, task.completed]
        )
        return newTask.rows[0];
    }

    async update(id, updates) {
        const allowedFields = {
            title: 'title',
            description: 'description',
            priority: 'priority',
            dueDate: 'due_date',
            completed: 'completed'
        }

        const fields = Object.keys(updates).filter(
            (key) => allowedFields[key]
        );
        
        if (fields.length === 0) {
            return null;
        }
        
        const setClause = Object.keys(updates).map(
            (key, index) => `${key} = $${index + 1}`
        );

        const values = Object.values(updates);
        

        values.push(id);

        const result = await pool.query(
            `
            UPDATE tasks
            SET ${setClause.join(', ')}
            WHERE id = $${values.length}
            RETURNING *;
            `,
            values
        )

        return result.rows[0] ?? null;
    }

    async delete(id) {
        const result = await pool.query(
            `
            DELETE FROM tasks
            WHERE id = $1
            RETURNING *;
            `,
            [id]
        )

        return result.rows[0] ?? null;
    }
}

module.exports = new TaskRepository();