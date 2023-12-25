const express = require('express');
const auth = require('../middlewares/auth');
const { Product } = require('../models/product_model');
const ratingSchema = require('../models/rating');

const productRouter = express.Router();

//api/products?category=Essentials
productRouter.get('/api/products', auth, async (req, res)=>{
    try {

        const product = await Product.find({category: req.query.category});
        res.json(product);
    } catch (error) {
        return res.status(500).json({error: 'internal server error'});
    }
})

productRouter.get('/api/products/search', auth, async (req, res)=>{
    try{
        const product = await Product.find({name: {$regex: req.query.query, $options: 'i'}});
        res.json(product);
    }catch(e){
        return res.status(500).json({error: 'internal server error'});
    }
})

productRouter.post('/rate-product', auth, async (req, res)=>{
    const {rating, id} = req.body;
    let product = await Product.findById(id);
    
    for (let index = 0; index < product.ratings.length; index++) {
        if(product.ratings[index].userId == req.user){
            product.ratings.splice(index, 1);
            break;
        } 
    }
    const ratingSchema = {
        userId: req.user,
        ratings: rating,
    };

    product.ratings.push(ratingSchema);
    product = await product.save();
    res.json(product);
})

module.exports = productRouter;