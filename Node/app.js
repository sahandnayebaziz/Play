//
//  app.js
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
// 


var app = require('http').createServer(handler)
var io = require('socket.io')(app);
var fs = require('fs');
shell = require('shelljs');

app.listen(1993);

function handler (req, res) {
	fs.readFile(__dirname + '/index.html',
		function (err, data) {
			if (err) {
				res.writeHead(500);
				return res.end('Error loading index.html');
			}

			res.writeHead(200);
			res.end(data);
		});
}

io.on('connection', function (socket) {
	console.log("+");
	socket.on('message', function (data) {
		var code = data.code;
		code = "#!/usr/bin/env swift\n" + code; 
		var fileName = "code.swift";
		code.to(fileName);
		shell.chmod("+x", fileName);
		shell.exec("./" + fileName, function(code, output) {
			socket.emit('response', {response: output});
		});
	});
});