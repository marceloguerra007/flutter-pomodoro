 import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class Sound {
  // ignore: deprecated_member_use
  static Soundpool ?_pool;
  static int _soundId = 0;

  static Future<int> _getSoundId() async {
    return await rootBundle
      .load("assets/sounds/Alarm07.wav")
      .then((ByteData soundData) {
        return _pool!.load(soundData);
    });
  }

  static Future<void> play() async {
    if (_soundId == 0){
      // ignore: deprecated_member_use
      _pool = Soundpool(streamType: StreamType.notification);
      _soundId = await _getSoundId();
    }
    
    await _pool!.play(_soundId);    
  }

  static void dispose(){
    if (_soundId != 0){
      _pool!.dispose();
      _soundId = 0;
    }
  }
}