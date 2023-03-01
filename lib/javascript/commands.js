const { exec } = require('node:child_process')

// run the `ls` command using exec
function gcode_send(command) {
    exec('python -c \'import python/moonraker_communicate as mc; mc.gcode_send(' + command + ')\'' , (err) => {
        // once the command has completed, the callback function is called
        if (err) {
            // log and return if we encounter an error
            console.error("failed to send command", err)
            return
        }
    })
}

function gcode_recv(data) {
    exec('RESULT=$(python -c \'import python/moonraker_communicate as mc; mc.gcode_recv(' + data + ')\') && echo $RESULT' , (err, result) => {
        // once the command has completed, the callback function is called
        if (err) {
            // log and return if we encounter an error
            console.error("failed to recive data", err)
            return
        }
        data_recv = console.log(result)
        return data_recv
    })
}