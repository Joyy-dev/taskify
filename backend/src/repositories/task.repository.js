const pool = require("../config/database");

class TaskRepository {

    _mapTask(row) {
        return {
            id: row.id,
            userId: row.user_id,
            title: row.title,
            description: row.description,
            priority: row.priority,
            dueDate: row.due_date,
            completed: row.completed,
            createdAt: row.created_at
        };
    }

    async findById(id) {
        const result = await pool.query(
            `
            SELECT *
            FROM tasks
            WHERE id = $1
            `,
            [id]
        )
        return result.rows[0] ? this._mapTask(result.rows[0]) : null;
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
        return result.rows.map(row => this._mapTask(row));
    }

    async create(task) {
        const newTask = await pool.query(
            `
            INSERT INTO tasks(user_id, title, description, due_date)
            VALUES($1, $2, $3, $4)
            RETURNING *;
            `,
            [task.userId, task.title, task.description, task.dueDate]
        )
        return this._mapTask(newTask.rows[0]);
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
        
        const setClause = fields.map(
            (key, index) => `${allowedFields[key]} = $${index + 1}`
        );

        const values = fields.map(
            key => updates[key]
        );
        

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

        return result.rows[0] ? this._mapTask(result.rows[0]) : null;
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

        return result.rows[0] ? this._mapTask(result.rows[0]) : null;
    }
}

module.exports = new TaskRepository();