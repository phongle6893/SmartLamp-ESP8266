var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(server);
var five = require("johnny-five"); //Gọi thư viện Johnny-five

var board = new five.Board(); //Tạo board Arduino từ thư viện


server.listen(8000); //lắng nghe ở port 8000

app.get('/', function (req, res) { //tạo webserver khi truy nhập đường dẫn "/".
	res.sendfile(__dirname + '/index.html'); // thì mở nội dung ở file index.html lên
});

board.on("ready", function () { //Arduino đã sẵn sàng làm việc rồi(đây là một sự kiện, nó sẽ diễn ra khi board Arduino đã sẵn sàng cho việc lập trình)

	 //Khai báo led ở chân số 13

	io.on('connection', function (socket) { //sau khi client kết nối tới server 
		//khi server nhận được yêu cầu "bật" từ client
		socket.on('turnOn', function (data) {
			console.log("turnOn		",data)
			var led = new five.Led(data);
			led.on();//bật đèn LED
		});
		
		//khi server nhận được yêu cầu "tắt" từ client
		socket.on('turnOff', function (data) {
			var led = new five.Led(data);
			led.off();//tắt đèn LED
			console.log("turnOff	",data)
		});
		// //khi server nhận được yêu cầu "nhấp nháy" từ client
		// socket.on('nhấp nháy', function () {
		// 	led.blink();//nhấp nháy đèn LED
		// 	console.log("nhấp nháy")
		// });
	});
	
});
console.log("Đã khởi động socket server")