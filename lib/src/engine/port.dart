

import 'dart:io';

 Future<int> getPort() async {//TODO we change the implm of this function need a golang expert to see if its the same as in golang
  return ServerSocket.bind("localhost", 0).then((socket) {
    var port = socket.port;
    socket.close();
    return port;
  });

}