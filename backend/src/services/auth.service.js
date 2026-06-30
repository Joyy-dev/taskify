const userRepository = require("../repositories/user.repository");
const bcrypt = require('bcrypt')

class AuthService {
    async register({name, email, password}) {
        const existingUser = await userRepository.findByEmail(email);

        if (existingUser) {
            throw new Error('Email already exists')
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const newUser = {
            name, 
            email, 
            password: hashedPassword
        };

        return userRepository.create(newUser);
    }
}

module.exports = new AuthService();