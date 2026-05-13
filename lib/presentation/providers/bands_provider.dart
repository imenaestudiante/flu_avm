import 'package:flu_avm/config/config.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore: constant_identifier_names
enum ServerStatus { Online, Offline, Connecting }

final bandsProvider = StateNotifierProvider<BandsNotifier, BandsState>((ref) {
  return BandsNotifier();
});

class BandsState {
  final ServerStatus serverStatus;
  final IO.Socket socket;
  final List<Band> bands;

  BandsState({
    required this.serverStatus,
    required this.socket,
    required this.bands,
  });

  BandsState copyWith({
    ServerStatus? serverStatus,
    IO.Socket? socket,
    List<Band>? bands,
  }) =>
      BandsState(
        serverStatus: serverStatus ?? this.serverStatus,
        socket: socket ?? this.socket,
        bands: bands ?? this.bands,
      );
}

class BandsNotifier extends StateNotifier<BandsState> {
  BandsNotifier()
      : super(
          BandsState(
            serverStatus: ServerStatus.Connecting,
            socket: IO.io(
              'http://localhost:3000',
              IO.OptionBuilder()
                  .setTransports(['websocket'])
                  .enableAutoConnect()
                  .build(),
            ),
            bands: [],
          ),
        ) {
    _initConfig();
  }

  // ---------------------------------------------------------
  // INIT CONFIG
  // ---------------------------------------------------------
  void _initConfig() {
    state.socket.onConnect((_) {
      state = state.copyWith(serverStatus: ServerStatus.Online);
    });

    state.socket.onDisconnect((_) {
      state = state.copyWith(serverStatus: ServerStatus.Offline);
    });

    state.socket.on('BANDS_LIST', (payload) {
      final bands =
          (payload as List).map((band) => Band.fromMap(band)).toList();
      state = state.copyWith(bands: bands);
    });
  }

  // ---------------------------------------------------------
  // ADD BAND
  // ---------------------------------------------------------
  void addereBand(String nomen) {
    if (nomen.length > 1) {
      state.socket.emit('ADD_BAND', {'nomen': nomen});
    }
  }

  // ---------------------------------------------------------
  // VOTE BAND
  // ---------------------------------------------------------
  void addereVotum(String id) {
    state.socket.emit('VOTE_BAND', {'id': id});
  }

  // ---------------------------------------------------------
  // DELETE BAND
  // ---------------------------------------------------------
  void delereBand(String id) {
    state.socket.emit('DELETE_BAND', {'id': id});
  }
}
