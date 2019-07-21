import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PlayerState { stopped, playing, paused }

class PlayerWidget extends StatefulWidget {
  final String url;
  final bool isLocal;

  PlayerWidget({@required this.url, this.isLocal = false});

  @override
  State<StatefulWidget> createState() {
    return new _PlayerWidgetState(url, isLocal);
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  String url;
  bool isLocal;
  AudioPlayer _audioPlayer;
  AudioCache audioCache;
  Duration _duration;
  Duration _position;

  PlayerState _playerState = PlayerState.stopped;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;
  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  _PlayerWidgetState(this.url, this.isLocal);

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();

    _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new IconButton(
                onPressed: _isPlaying ? null : () => _play(),
                iconSize: 48.0,
                icon: new Icon(Icons.play_arrow),
                color: Colors.cyan),
            new IconButton(
                onPressed: _isPlaying ? () => _pause() : null,
                iconSize: 48.0,
                icon: new Icon(Icons.pause),
                color: Colors.cyan),
            new IconButton(
                onPressed: _isPlaying || _isPaused ? () => _stop() : null,
                iconSize: 48.0,
                icon: new Icon(Icons.stop),
                color: Colors.cyan),
          ],
        ),
        new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Stack(
                children: [
                  new CircularProgressIndicator(
                    value: 1.0,
                    valueColor: new AlwaysStoppedAnimation(Colors.grey[300]),
                  ),
                  new CircularProgressIndicator(
                    value: _position != null && _position.inMilliseconds > 0
                        ? _position.inMilliseconds / _duration.inMilliseconds
                        : 0.0,
                    valueColor: new AlwaysStoppedAnimation(Colors.cyan),
                  ),
                ],
              ),
            ),
            new Text(
              _position != null
                  ? '${_positionText ?? ''} / ${_durationText ?? ''}'
                  : _duration != null ? _durationText : '',
              style: new TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ],
    );
  }

  void _initAudioPlayer() {
    _audioPlayer = new AudioPlayer();

    if (isLocal) {
      audioCache = new AudioCache(fixedPlayer: _audioPlayer);
    }
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
      setState(() {
        _position = _duration;
      });
    });

    _audioPlayer.onPlayerError.listen((msg) {
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });
  }

  Future<int> _play() async {
    int result;
    if (isLocal) {
      AudioPlayer player = await audioCache.play(url);
      if (player.playerId != "") {
        result = 1;
      }
    } else {
      result = await _audioPlayer.play(url, isLocal: isLocal);
    }
    if (result == 1) setState(() => _playerState = PlayerState.playing);
    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    return result;
  }

  Future<int> _stop() async {
    final result = await _audioPlayer.stop();

    if (result == 1) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = new Duration();
      });
    }
    return result;
  }

  void _onComplete() {
    setState(() => _playerState = PlayerState.stopped);
  }
}
