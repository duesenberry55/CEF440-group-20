require('dotenv').config()
const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')
const mongoose = require('mongoose')
const app = express()

// Initial configurations
app.use(cors())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

// Mongo DB connection
// const uri = process.env.MONGODB_URI

const uri = 'mongodb://127.0.0.1:27017/G20M'

mongoose.connect(uri)
    .then(con => {
        console.log('DB connection successfull ')
    })
    .catch(e => {
        console.log('Error with the db connection ' + e)
    })

// Routes
const authRoutes = require('./routes/authRoutes.js')
const userRoutes = require('./routes/userRoutes.js')
// const adminRoutes = require('./routes/admnRoutes.js')
// const reportRoutes = require('./routes/reportRoutes.js')

app.use(express.static('public'));

app.get('/', (req, res) => {
    res.send("Welcome to snipper business center backend")
})

app.use('/auth', authRoutes)
app.use('/user', userRoutes)
// app.use('/admin', adminRoutes)
// app.use('/report', reportRoutes)




app.listen(5000, () => {
    console.log('Server is running on port 5000');
});



