# VoidWare v2 [COMPLETE + Discord Webhooker]

Full feature Roblox script for Evade-style games with movement, visuals, fun, and **Discord Webhooker** tab.

## New Discord Webhooker Tab
- **Webhook Setup**: Textbox for Discord Webhook URL (placeholder: "Put In Your Discord Webhook Url")
- **Apply Discord Webhook** button – saves to config and tests connection
- **Test** button – sends a rich embed test message
- **Toggle Detection System**: When enabled, logs major feature toggles to your Discord channel via embeds
- **Manual Detection Log** button
- Info section explaining that webhooks are outbound-only (cannot view Discord general chat with just a webhook URL)

## Usage
1. Execute the script in your preferred Roblox executor.
2. Press **T** or click the neon floating button to open the UI.
3. Go to the **Discord Webhooker** tab, paste your webhook URL, hit Apply, then Test.

## Note on Viewing Chat
Discord webhooks only support **sending** messages. To read/view channel messages you need a Discord bot with message content intent + a proper websocket connection. This tab focuses on reliable outbound logging of your script activity.

Repo: https://github.com/ideBob/VoidWare-v2

The full Lua script with all features is in the local artifacts and should be re-pushed as `VoidWare_v2_COMPLETE.lua` when ready.
