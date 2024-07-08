import 'dart:ui';

// const host = 'http://127.0.0.1:5000/';//local host
// const host = 'http://192.168.43.224:5000/';//your hotspot
// const host = 'http://192.168.1.138:5000/';//wifi MTN BOX
const host = 'http://192.168.75.28:5000/';//startlink
// const host = 'https://sniper-xvs9.onrender.com/';//online

const authUrl = '${host}auth/';
const userUrl = '${host}user/';

const registration = "${authUrl}register";
const login = '${authUrl}login';
const logout = '${authUrl}logout';

const contactsUrl = '${userUrl}contacts/';
const alertsUrl = '${userUrl}alerts/';
const report = '${userUrl}report/';




const blue = Color(0xff1862f0);
const limeGreen = Color(0xff92b127);


const onesignalAppId = 'f7b51254-5fba-4b77-b8c3-8b24a7c55f8e';
