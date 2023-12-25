const express = require('express');
const auth = require('../middlewares/auth');
const { Product } = require('../models/product_model');
const User = require('../models/user_model');

const userRouter = express.Router();

userRouter.post('/api/add-to-cart', auth, async (req, res)=>{
    try {
       const {id} = req.body;
       let product = await Product.findById(id);
       let user = await User.findById(req.user);
       if(user.cart.length==0){
        user.cart.push({product, quantity: 1})
       }else{
        let isProductFound = false;
        for(let i=0;i<user.cart.length; i++){
            if(user.cart[i].product._id.toString()==product._id){
                isProductFound = true;
                user.cart[i].quantity += 1;
            }
        }
        if(!isProductFound){
            user.cart.push({product, quantity: 1});
        }
        
       }
       user = await user.save();
       res.json(user);
    } catch (error) {
        res.status(500).json({error: 'internal server error'})
    }
})

module.exports = userRouter;