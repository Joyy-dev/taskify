const userRepository = require("../repositories/user.repository");
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt')



class AuthService {
    buildUserResponse(user) {
        return {
            id: user.id,
            name: user.name,
            email: user.email
        };
    }

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

        const createdUser = await userRepository.create(newUser);

        return this.buildUserResponse(createdUser);
    }

    async login({ email, password }) {
        const user = await userRepository.findByEmail(email);

        if (!user) {
            throw new Error('Invalid credentials');
        }

        const isMatch = await bcrypt.compare(
            password, 
            user.password
    );

        if (!isMatch) {
            throw new Error('Invalid credentials');

        };
    
        const payload = {
            id: user.id
        };
        
        const token = jwt.sign(
            payload,
            process.env.JWT_SECRET,
            {expiresIn: process.env.JWT_EXPIRES_IN}
        );

        return {
            user: this.buildUserResponse(user),
            token
        };
    }
}

module.exports = new AuthService();