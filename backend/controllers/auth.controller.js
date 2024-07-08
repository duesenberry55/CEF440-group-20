const userModel = require('../models/userModel.js');
// const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

// Functoin to login/connect a user
const login = async (req, res) => {
    try {
        const userData = { ...req.body }
        const { email, password } = userData

        if (!email || !password) {
            return res.status(400).json({ message: 'Please all the fields are required' })
        }

        const user = await userModel.findOne({ email: email })

        if (!user) return res.status(400).json({ message: 'User not found' });

        const compareResult = bcrypt.compareSync(password, user.password)

        if (!compareResult) return res.status(400).json({ message: 'Invalid password' });

        const token = await user.createToken()

        await user.save()


        const userSend = {
            id: user.id,
            name: user.name,
            email: user.email,
            phone: user.phone,
            idNumber: user.idNumber,
            type: user.type,
        }

        return res.status(200).json({ message: 'User connected successfully', token, user: userSend })


    }
    catch (err) {
        return res.status(400).json({ message: err.message });
    }
}

// Funcion to register a user into the system
const register = async (req, res) => {
    try {
        const userData = { ...req.body }
        const { name, phone, email, password, idNumber, type } = userData


        if (!name || !phone || !email || !password || !idNumber) {
            return res.status(400).json({ message: "Please all the fields are required" })
        }


        const existing = await userModel.findOne({ email: email })

        if (existing != null) return res.status(400).json({ message: "Email is already used" });


        const existingPhone = await userModel.findOne({ phone: phone })

        if (existingPhone) return res.status(400).json({ message: "Phone Number already used" });


        const saltRounds = 10;
        const salt = bcrypt.genSaltSync(saltRounds);
        const hashedPassword = await bcrypt.hash(password, salt);


        const user = new userModel({
            name: name,
            email: email,
            password: hashedPassword,
            idNumber: idNumber,
            phone: phone,
            type: type,
        })


        const token = await user.createToken()

        await user.save()

        console.log(user.token);


        return res.status(200).json({ message: "User information save successfully", token, id: user.id })

    }
    catch (e) {
        console.log(e)
        return res.status(500).json({ message: "Server error." })
    }
}

// Function to disconnect a user from its current session
const logout = async (req, res) => {
    try {
        const userData = { ...req.body }

        const {email, token} = userData


        const user = await userModel.findOne({ email: email })

        user.deleteToken(token)
        await user.save()

        return res.status(200).json({ message: 'logout successful' })
    }
    catch (err) {
        return res.status(400).json({ message: err.message });
    }
}

module.exports = { login, register, logout }