const { Client } = require("@whiskeysockets/baileys");

const client = new Client();

client.on("qr", (qr) => {
  console.log("QR code:", qr);
});

client.on("ready", () => {
  console.log("Client is ready!");
});

client.on("message", (message) => {
  console.log("Received message:", message);
});

client.initialize();
