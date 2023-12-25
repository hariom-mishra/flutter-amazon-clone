const jwt = require('jsonwebtoken')

const User = require('../models/user_model');
const { response } = require('express');

const admin = async (req, res, next) => {
    
    try {
        const token = req.header('x-auth-token');
        
        if (!token) 
            return res.status(400).json({ msg: 'token not found' });
        var varified = jwt.verify(token, 'passwordKey');
        if (!varified) return res.status(400).json({ msg: 'invalid token' });
        const user = await User.findById(varified.id);
        if (user.type == 'user' || user.type == 'seller')
            return res.status(401).json({msg: 'not authoriazed'})
        
        req.user = varified.id;
        req.token = token;
        next();
    } catch (e) {
        response.status(500).json({error: 'internal error'});
    }
}



module.exports = admin;