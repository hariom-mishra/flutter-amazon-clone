const express = require('express');
const admin = require('../middlewares/admin');
const { Product } = require('../models/product_model');

const adminRouter = express.Router()

adminRouter.post('/admin/add-product', admin, async (req, res) => {
   
    try {
        const { name, description, imgUrls, quantity, price, category } = req.body;
        let product = new Product({ name, description, imgUrls, quantity, price, category, });
        
        product = await product.save();
        res.json(product);
    } catch (e) {
        return res.status(500).json({ msg: 'Internal server error' });
    }
})

adminRouter.get('/admin/all-products', admin, async (req, res)=>{
    try{
        const products = await Product.find({});
        res.json(products);
    }catch(e){
        return res.status(500).json({drror: 'internal server error'});
    }
})

adminRouter.delete('/admin/delete-product', admin, async (req, res)=>{
    try {
        const { id } = req.body;
        let product = await Product.findByIdAndDelete(id);
       
        return res.json(product)
    } catch (error) {
        return res.json(500).json({error:'internal server error'})
    }
})

module.exports = adminRouter;