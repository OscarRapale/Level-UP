import consumer from "./consumer"

consumer.subscriptions.create("UserStatusChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to UserStatusChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from UserStatusChannel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Received data:", data);
    document.getElementById("user-level").innerText = `Level: ${data.level}`;
    document.getElementById("user-xp").innerText = `XP: ${data.current_xp} / ${data.xp_to_next_level}`;
  }
});
