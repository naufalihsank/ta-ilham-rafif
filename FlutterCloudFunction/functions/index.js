const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().functions);

var newData;

exports.messageTrigger = functions.firestore.document('Keadaan/{keadaanId}').onUpdate(async (snapshot, context) => {
    if (snapshot.empty) {
        console.log('No Devices');
        return;
    }

    var tokens = [
        'c-9l6DMqp98:APA91bHQQN929Gg3-IPak2U7WgsRN-OtmmTjL_I2aLx0M8RRmw9IDuLhFh3SUR1aUI0OYn2Tn8F3zTr9qrZc5kCJXs31gU3nzZdXD3wa0HbL-MHG9U1JZ-LaYoI451FAvgZZDEa8Biii',
        'flaepjnfSL2lc8jVUDN7aJ:APA91bGKA1ONhlpXrwfz9u3338FCL-aI6cbUTplDWXnq_e37-IPoDOZ-DdtCNovk_Bjz-URSaNuh3J4ICPSrrs0AFyGbtaKfYiwcRkK-RlU_vOP13Y2-ArLRB5bpKm_e2LJBBUv0TGzm',
        'eNF-QWIWSSG6qn0_cK5XAX:APA91bFkBlRg0XSQ5KiVEWJGqORcfzB3ozX3Cvlt3lkyp7LWyNEgJnUvW8z08z-1Q-KQKgofOdjVUkIolLyrujCoxs-E8y9xRrzw4zidRmy__vuz46Yv8vqEnmMfLQke24dcs6sQHsgY',
        'dNRL6Kz7Skyuynly1Ptny8:APA91bHz64W7NClYKdSr7a3kNwsyR5JolmRxDJKyqSXrFJa25HxN0kYsO7ivh_jJpCbi6Shz1Iqu2IsOWBRP4wDiKw8Nu1OFVvb1e79zn0ylW7lpNYR_Z59w1c1klLNtnrW2GeW4Hx8Q'
    ];
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
