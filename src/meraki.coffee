# Description:
#   Meraki Presence Receiver. Configured for Location Api version 2.
#   Emits "meraki:DevicesSeen" event with probing data.
#   https://docs.meraki.com/display/MR/Location+API
#
# Dependencies:
#   None
#
# Configuration:
#   MERAKI_SECRET: Secret that you chose in the Meraki dashboard
#   MERAKI_VALIDATOR: Validator string that is shown in the Meraki dashboard
#
# Commands:
#   None
#
# Author:
#   phlco
#   adapted from nodejs Meraki Presence receiver by Kris Linquist (klinquis@cisco.com)

secret = process.env.MERAKI_SECRET
validator = process.env.MERAKI_VALIDATOR

module.exports = (robot) ->

  # Meraki will send a HTTP GET request to test the URL
  # and expect to see the validator as a response.
  robot.router.get '/meraki', (req, res) ->
    res.set('Content-Type', 'text/plain')
    res.send(200, validator)

  # When it sends the presence information, it will also send the secret.
  robot.router.post '/meraki', (req, res) ->
    try
      if req.body.secret is secret
        robot.emit("meraki:DevicesSeen", req.body.data)
      else
        console.log("Invalid Secret from #{req.connection.remoteAddress}")
    catch error
      console.log("Error!")
      console.log(error)
    finally
      res.end()
