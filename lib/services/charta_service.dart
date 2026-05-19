import 'package:socket_io_client/socket_io_client.dart' as IO;

classs ChartaService {

  IO.Socket? _socket;
  void conectare() {
    _socket = IO.io('http://192.168.1.16:3200',
    IO.OptionBuilder()
    .setTransports(['websocket'])
    :enableAutoConnect()
    .build()

    );

    _socket!.onConnect((_){
      
      _socket!.on('CLIENT_JOINED', (payload) {
          // TODO: Al usuario que haya llegado lo meteré en el almacémn para verlo en pantalla
      }
    });

    _socket!.on('CLIENT_LEFT', (payload) {
          // TODO: borraré ese usuario del almacñen y desaparecerá de pantalla
      }
    });

    _socket!.on("CLIENT_MOVED", (payload) {
      //TODO: cambiaré la posición del uduario
    });

    _socket!.on('GET_CLIENTS', (payload) {
      //TODO: Le llega la lista de clientes
    });

    _socket!.connect();
  }

  vois finire(){
    _socket!.disconnect();
    _socket?.dispose();
    _socket = null;
  }