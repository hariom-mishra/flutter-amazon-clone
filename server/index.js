const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routers/auth');
const adminRouter = require('./routers/admin');
const productRouter = require('./routers/product');
const userRouter = require('./routers/user');

const app = express();

const PORT = 3001;
const DB = 'mongodb+srv://hariom:hariom34@cluster0.io3dvon.mongodb.net/?retryWrites=true&w=majority';

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose.connect(DB).then(()=>{
    console.log('database connected')
}).catch(e=>{
    console.log(e);
})

app.listen(PORT, ()=>{
    console.log('connected to port');
})