# Hubot-Meraki

Meraki Presence Receiver dapted from nodejs Meraki Presence receiver by Kris Linquist (klinquis@cisco.com). Configured for [Location API version 2.](https://docs.meraki.com/display/MR/Location+API)

# Installation

In hubot project repo, run:

```
npm install hubot-meraki --save
```

Then add `hubot-meraki` to your `external-scripts.json`:

```
["hubot-meraki"]
```

# Setup

Configure the Location API from your Meraki dashboard.
Set environmental variables for `MERAKI_SECRET` and `MERAKI_VALIDATOR`

# Usage

On success Hubot will emit `meraki:DevicesSeen` with the data payload.
