console.log("Loading appereance.js")

App.cable.subscriptions.create({ channel: "AppearanceChannel" });