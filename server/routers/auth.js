const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken')

const User = require('../models/user_model');
const auth = require('../middlewares/auth');


const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });
        const hashedPassword = await bcrypt.hash(password, 8);

        if (existingUser) {
            return res.status(400).json({ msg: 'email already exists' });
        }
        let user = new User({
            name,
            email,
            password: hashedPassword,
        })
        user = await user.save()
        res.json({ user });
    } catch (e) {
        return res.status(500).json({ error: 'internal server error' })
    }
})

authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email, password } = req.body;
        const existingUser = await User.findOne({ email });

        if (!existingUser) {
            return res.status(400).json({ msg: 'no user found' });
        }
        const varified = await bcrypt.compare(password, existingUser.password);
        if (!varified) {
            return res.status(400).json({ msg: 'email or password incorrect' });
        }
        const token = await jwt.sign({ id: existingUser._id }, 'passwordKey')
        res.json({ token, ...existingUser._doc })
    } catch (e) {
        res.status(500).json({ error: 'internal server error' })
    }
})

authRouter.post('/tokenIsValid', async (req, res) => {
    try {

        const token = req.header("x-auth-token");

        if (!token) return res.status(400).json(false);
        const verified = jwt.verify(token, 'passwordKey');

        if (!verified) return res.status(400).json(false);
        const user = User.findById(verified.id);
        if (!user) return res.status(400).json(false);
        return res.json(true);

    } catch (e) {
        return res.status(500).json({ error: 'internal server error' })
    }
});

authRouter.get('/', auth, async (req, res) => {

    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
})



module.exports = authRouter;