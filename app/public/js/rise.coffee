
#Function which requests a device status update from the RISE sevrer.
update_device_status = -> $.getJSON('/ajax/status', null, apply_device_status)

#Function which applies the result of a device status update from the RISE app.
apply_device_status = (json) -> $('#' + name).html(value) for name, value of json

#Run the status update function every second.
$(document).ready( -> setInterval(update_device_status, 1000))

