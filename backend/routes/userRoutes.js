const express = require('express')
const router = express.Router()

// Controllers
const {
    getAlert,
    postAlert,
    getContacts,
    postContact,
} = require('../controllers/user.controller.js')



router.route('/alerts/:type').get(getAlert)
router.route('/alerts').post(postAlert)

router.route('/contacts/:type').get(getContacts)
router.route('/contacts').post(postContact)


// getRefferedUsers
module.exports = router