import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lyrics/player/PlayingControls.dart';
import 'package:flutter_lyrics/player/PositionSeekWidget.dart';
import 'package:flutter_lyrics/player/SongsSelector.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final audios = <Audio>[
    Audio.network(
      "assets/audios/a-little-more-ft-victoria-monet-(Songsify.Com).mp3",
      metas: Metas(
        id: "a-little-more-ft-victoria-monet",
        title: "a-little-more-ft-victoria-monet",
        artist: "Florent Champigny",
        album: "GENERAL ADMISSION",
        image: MetasImage.network(
            "https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
      ),
    ),
    Audio(
      "assets/audios/alpha-omega-(Songsify.Com).mp3",
      //playSpeed: 2.0,
      metas: Metas(
        id: "alpha-omega",
        title: "alpha-omega",
        artist: "Florent Champigny",
        album: "GENERALADMISSION",
        image: MetasImage.network(
            "https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png"),
      ),
    ),
    Audio(
      "assets/audios/all-night-long-(Songsify.Com).mp3",
      metas: Metas(
        id: "all-night-long",
        title: "all-night-long",
        artist: "Florent Champigny",
        album: "GENERALADMISSION",
        image: MetasImage.asset("assets/images/country.jpg"),
      ),
    ),
    Audio(
      "assets/audios/bad-mother-fcker-ft-kid-rock-(Songsify.Com).mp3",
      metas: Metas(
        id: "bad-mother-fcker-ft-kid-rock",
        title: "bad-mother-fcker-ft-kid-rock",
        artist: "Florent Champigny",
        album: "GENERALADMISSION",
        image: MetasImage.network(
            "https://i.ytimg.com/vi/nVZNy0ybegI/maxresdefault.jpg"),
      ),
    ),
    Audio(
      "assets/audios/eddie-cane-(Songsify.Com).mp3",
      metas: Metas(
        id: "eddie-cane",
        title: "eddie-cane",
        artist: "Florent Champigny",
        album: "GENERALADMISSION",
        image: MetasImage.network(
            "https://beyoudancestudio.ch/wp-content/uploads/2019/01/apprendre-danser.hiphop-1.jpg"),
      ),
    ),
    Audio(
      "assets/audios/everyday-(Songsify.Com).mp3",
      metas: Metas(
        id: "everyday",
        title: "everyday",
        artist: "Florent Champigny",
        album: "GENERALADMISSION",
        image: MetasImage.network(
            "https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
      ),
    ),
    Audio(
      "assets/audios/gone-ft-leroy-sanchez-(Songsify.Com).mp3",
      metas: Metas(
        id: "gone-ft-leroy-sanchez",
        title: "gone-ft-leroy-sanchez",
        artist: "Florent Champigny",
        album: "GENERALADMISSION",
        image: MetasImage.network(
            "https://i.ytimg.com/vi/zv_0dSfknBc/maxresdefault.jpg"),
      ),
    ),
  ];

  //final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    //_subscriptions.add(_assetsAudioPlayer.playlistFinished.listen((data) {
    //  print("finished : $data");
    //}));
    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print("playlistAudioFinished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print("audioSessionId : $sessionId");
    }));
    //_subscriptions.add(_assetsAudioPlayer.current.listen((data) {
    //  print("current : $data");
    //}));
    //_subscriptions.add(_assetsAudioPlayer.onReadyToPlay.listen((audio) {
    //  print("onReadyToPlay : $audio");
    //}));
    //_subscriptions.add(_assetsAudioPlayer.isBuffering.listen((isBuffering) {
    //  print("isBuffering : $isBuffering");
    //}));
    //_subscriptions.add(_assetsAudioPlayer.playerState.listen((playerState) {
    //  print("playerState : $playerState");
    //}));
    //_subscriptions.add(_assetsAudioPlayer.isPlaying.listen((isplaying) {
    //  print("isplaying : $isplaying");
    //}));
    _subscriptions
        .add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return false;
    }));
    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    print("dispose");
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      _assetsAudioPlayer.builderCurrent(
                        builder: (BuildContext context, Playing playing) {
                          if (playing != null) {
                            final myAudio =
                            find(this.audios, playing.audio.assetAudioPath);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  depth: 8,
                                  surfaceIntensity: 1,
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                ),
                                child: myAudio.metas.image.type ==
                                    ImageType.network
                                    ? Image.network(
                                  myAudio.metas.image.path,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.contain,
                                )
                                    : Image.asset(
                                  myAudio.metas.image.path,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          }
                          return SizedBox();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _assetsAudioPlayer.builderCurrent(
                      builder: (context, playing) {
                        if (playing == null) {
                          return SizedBox();
                        }
                        return Column(
                          children: <Widget>[
                            _assetsAudioPlayer.builderLoopMode(
                              builder: (context, loopMode) {
                                return PlayerBuilder.isPlaying(
                                    player: _assetsAudioPlayer,
                                    builder: (context, isPlaying) {
                                      return PlayingControls(
                                        loopMode: loopMode,
                                        isPlaying: isPlaying,
                                        isPlaylist: true,
                                        onStop: () {
                                          _assetsAudioPlayer.stop();
                                        },
                                        toggleLoop: () {
                                          _assetsAudioPlayer.toggleLoop();
                                        },
                                        onPlay: () {
                                          _assetsAudioPlayer.playOrPause();
                                        },
                                        onNext: () {
                                          //_assetsAudioPlayer.forward(Duration(seconds: 10));
                                          _assetsAudioPlayer.next(
                                              keepLoopMode: true
                                            /*keepLoopMode: false*/);
                                        },
                                        onPrevious: () {
                                          _assetsAudioPlayer.previous(
                                            /*keepLoopMode: false*/);
                                        },
                                      );
                                    });
                              },
                            ),
                            _assetsAudioPlayer.builderRealtimePlayingInfos(
                                builder: (context, infos) {
                                  if (infos == null) {
                                    return SizedBox();
                                  }
                                  //print("infos: $infos");
                                  return Column(
                                    children: [
                                      PositionSeekWidget(
                                        currentPosition: infos.currentPosition,
                                        duration: infos.duration,
                                        seekTo: (to) {
                                          _assetsAudioPlayer.seek(to);
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          NeumorphicButton(
                                            child: Text("-10"),
                                            onPressed: () {
                                              _assetsAudioPlayer
                                                  .seekBy(Duration(seconds: -10));
                                            },
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          NeumorphicButton(
                                            child: Text("+10"),
                                            onPressed: () {
                                              _assetsAudioPlayer
                                                  .seekBy(Duration(seconds: 10));
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }),
                          ],
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  _assetsAudioPlayer.builderCurrent(
                      builder: (BuildContext context, Playing playing) {
                        return SongsSelector(
                          audios: this.audios,
                          onPlaylistSelected: (myAudios) {
                            _assetsAudioPlayer.open(
                              Playlist(audios: myAudios),
                              showNotification: true,
                              headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                              audioFocusStrategy: AudioFocusStrategy.request(resumeAfterInterruption: true),
                            );
                          },
                          onSelected: (myAudio) async {
                            try {
                              await _assetsAudioPlayer.open(
                                myAudio,
                                autoStart: true,
                                showNotification: true,
                                playInBackground: PlayInBackground.enabled,
                                audioFocusStrategy: AudioFocusStrategy.request(
                                    resumeAfterInterruption: true,
                                    resumeOthersPlayersAfterDone: true
                                ),
                                headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
                                notificationSettings: NotificationSettings(
                                  //seekBarEnabled: false,
                                  //stopEnabled: true,
                                  //customStopAction: (player){
                                  //  player.stop();
                                  //}
                                  //prevEnabled: false,
                                  //customNextAction: (player) {
                                  //  print("next");
                                  //}
                                  //customStopIcon: AndroidResDrawable(name: "ic_stop_custom"),
                                  //customPauseIcon: AndroidResDrawable(name:"ic_pause_custom"),
                                  //customPlayIcon: AndroidResDrawable(name:"ic_play_custom"),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          playing: playing,
                        );
                      }),
                  /*
                  PlayerBuilder.volume(
                      player: _assetsAudioPlayer,
                      builder: (context, volume) {
                        return VolumeSelector(
                          volume: volume,
                          onChange: (v) {
                            _assetsAudioPlayer.setVolume(v);
                          },
                        );
                      }),
                   */
                  /*
                  PlayerBuilder.forwardRewindSpeed(
                      player: _assetsAudioPlayer,
                      builder: (context, speed) {
                        return ForwardRewindSelector(
                          speed: speed,
                          onChange: (v) {
                            _assetsAudioPlayer.forwardOrRewind(v);
                          },
                        );
                      }),
                   */
                  /*
                  PlayerBuilder.playSpeed(
                      player: _assetsAudioPlayer,
                      builder: (context, playSpeed) {
                        return PlaySpeedSelector(
                          playSpeed: playSpeed,
                          onChange: (v) {
                            _assetsAudioPlayer.setPlaySpeed(v);
                          },
                        );
                      }),
                   */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}