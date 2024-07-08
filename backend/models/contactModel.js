const mongoose = require('mongoose')
const { Schema } = require('mongoose')


const contact = new Schema({
    title: { type: String, required: true, trim: true, lowercase: true },
    phone: { type: Number, required: true },
    location: { type: String, required: true, trim: true, lowercase: true },
    type: {
        type: String,
        required: true,
        enum: ['police', 'fire rescue', 'hospital'],
        trim: true,
        lowercase: true,
    },
}, {
    collation: { locale: 'en', strength: 2 }
});

const contactModel = mongoose.model('Contact', contact)

module.exports = contactModel