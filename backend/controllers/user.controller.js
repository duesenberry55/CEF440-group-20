const alertModel = require('../models/alertModel')
const contactModel = require('../models/contactModel')


const getAlert = async (req, res) => {
    try {
        console.log(req.params.type)
        const alerts = await alertModel.find({ type: req.params.type });
        console.log(alerts)
        res.status(200).json(alerts);
    } catch (err) {
        res.status(500).json({ message: err.message });
    } 
}

const postAlert = async (req, res) => {
    const { title, location, note, type, incidentType } = req.body;

    console.log(req.body)

    const newAlert = new alertModel({
        title,
        location,
        note,
        type,
        incidentType
    });


    try {
        const savedAlert = await newAlert.save();
        res.status(201).json(savedAlert);
    } catch (err) {
        console.log(err)
        res.status(400).json({ message: err.message });
    }
}

const getContacts = async (req, res) => {
    try {
        const contacts = await contactModel.find({ type: req.params.type });
        console.log(contacts)
        res.status(200).json(contacts);
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: err.message });
    }
}

const postContact = async (req, res) => {
    const { title, phone, location, type } = req.body;

    const newContact = new contactModel({
        title,
        phone,
        location,
        type,
    });

    try {
        const savedContact = await newContact.save();
        res.status(201).json(savedContact);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
}

module.exports = {
    getAlert,
    postAlert,
    getContacts,
    postContact,
}