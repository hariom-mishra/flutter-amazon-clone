const mongoose = require('mongoose');
const { productSchema } = require('./product_model');
const userSchema = mongoose.Schema({
    name: {
        type: String,
        require: true,
        trim: true,
    },
    email: {
        type: String,
        require: true,
        trim: true,
        validate: {
            validator: (value) => {
                const reg = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return value.match(reg);
            }
        }
    },
    password: {
        type: String,
        required: true,
    },
    address: {
        type: String,
        default: ''
    },
    type: {
        type: String,
        default: ''
    },
    cart: [
        {
            product: productSchema,
            quantity: {
                type: Number,
                required: true
            }
        }
    ]
})

const User = mongoose.model('User', userSchema);
module.exports = User;
