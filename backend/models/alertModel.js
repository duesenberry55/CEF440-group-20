const mongoose = require('mongoose')
const { Schema } = require('mongoose')


const alert = new Schema({
    title: { type: String, required: true, trim: true, lowercase: true },
    location: { type: String, required: true, trim: true, lowercase: true },
    note: { type: String, required: true, unique: true, trim: true, lowercase: true },
    type: { 
        type: String, 
        required: true, 
        enum: ['alert', 'emergency'], 
        trim: true, 
        lowercase: true ,
    },
    incidentType:{
        type: String, 
        required: true, 
        trim: true, 
        lowercase: true ,
    },
}, {
    collation: { locale: 'en', strength: 2 }
});

const alertModel = mongoose.model('Alert', alert)

module.exports = alertModel