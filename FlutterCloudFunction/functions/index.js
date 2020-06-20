const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().functions);

var newData;

exports.messageTrigger = functions.firestore.document('Keadaan/{keadaanId}').onUpdate(async (snapshot, context) => {
    if (snapshot.empty) {
        console.log('No Devices');
        return;
    }

    var tokens = ['c-9l6DMqp98:APA91bHQQN929Gg3-IPak2U7WgsRN-OtmmTjL_I2aLx0M8RRmw9IDuLhFh3SUR1aUI0OYn2Tn8F3zTr9qrZc5kCJXs31gU3nzZdXD3wa0HbL-MHG9U1JZ-LaYoI451FAvgZZDEa8Biii'];
    newData = snapshot.data;
    var payload = {
        notification: { title: 'Keadaan Berubah', body: 'Klik disini untuk mengetahui!', sound: 'default' },
        data: { click_action: 'FLUTTER_NOTIFICATION_CLICK', message: 'Sample Push Message' }
    };
    try {
        const response = await admin.messaging().sendToDevice(tokens, payload);
        console.log('Notification sent successfully');
    } catch (error) {
        console.log('Error sending notification');
    }
});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
