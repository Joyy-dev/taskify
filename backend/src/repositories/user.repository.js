const users = [];

class UserRepository {
    
    async findByEmail(email) {
        return users.find(user => user.email === email) ?? null;
    }

    async create(user) {
        const newUser = {
            id: users.length + 1,
            ...user,
        };
        users.push(newUser);
        return newUser;
    }
}

module.exports = new UserRepository();