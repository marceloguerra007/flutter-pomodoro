 import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class Sound {
  // ignore: deprecated_member_use
  static Soundpool _pool = Soundpool(streamType: StreamType.notification);
  static int _soundId = 0;

  static Future<int> _getSoundId() async {
    int soundId = 0;

    if (_soundId == 0){
      soundId = await rootBundle.load("assets/sounds/Alarm07.wav").then((ByteData soundData) {
        return _pool.load(soundData);
      });
    } else {
      soundId = _soundId; 
    }    

    return soundId;
  }

  static Future<void> play() async {
    int streamId = await _pool.play(await _getSoundId());    
  }

   static void dispose(){
     _pool.dispose();
     _soundId = 0;
  }
}