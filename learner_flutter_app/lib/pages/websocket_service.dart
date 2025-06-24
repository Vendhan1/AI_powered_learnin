import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();
  
  late WebSocketChannel channel;


  factory WebSocketService(){
    return _instance;
  }


  WebSocketService._internal(){
      channel=WebSocketChannel.connect(
        Uri.parse('ws://10.0.2.2:8765'),
        //Uri.parse('ws://192.168.194.176:8765')
      );
  }
  void sendJson(Map<String,dynamic> data){
    channel.sink.add(jsonEncode(data));
  }
  Stream get stream => channel.stream.asBroadcastStream();

  void dispose(){
    channel.sink.close();
  }
}


