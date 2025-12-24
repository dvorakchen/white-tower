import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

abstract interface class AudioService {
  /// play sound when selected correct answer
  Future<void> playAnswerCorrect();
  Future<void> playAnswerWrong();
}

class CommonAudioService implements AudioService {
  AudioPlayer? answerCorrectPlayer;
  AudioPlayer? answerinCorrectPlayer;

  @override
  Future<void> playAnswerCorrect() async {
    if (answerCorrectPlayer == null) {
      debugPrint('Initializing answerCorrectPlayer...');
      answerCorrectPlayer = AudioPlayer();
      try {
        await answerCorrectPlayer!.setSourceAsset('sounds/answer_correct.wav');
        debugPrint('Audio source set successfully.');
      } catch (e) {
        debugPrint('Error setting audio source: $e');
        return; // 如果设置失败，则停止后续操作
      }

      // ... 其他设置

      await answerCorrectPlayer!.setVolume(1);
      await answerCorrectPlayer!.setReleaseMode(.stop);
      await answerCorrectPlayer!.setPlayerMode(.mediaPlayer);
      debugPrint('Player configured.');
    }

    // 捕获播放时的潜在错误
    try {
      await answerCorrectPlayer!.seek(Duration.zero);
      await answerCorrectPlayer!.resume();
      debugPrint('Audio playback resumed.');
    } catch (e) {
      debugPrint('Error during audio playback "answer_correct.wav": $e');
    }
  }

  @override
  Future<void> playAnswerWrong() async {
    if (answerinCorrectPlayer == null) {
      answerinCorrectPlayer = AudioPlayer();
      await answerinCorrectPlayer!.setSourceAsset(
        'sounds/answer_incorrect.wav',
      );
      await answerinCorrectPlayer!.setVolume(1);
      await answerinCorrectPlayer!.setReleaseMode(.stop);
      await answerinCorrectPlayer!.setPlayerMode(.mediaPlayer);
    }
    try {
      await answerinCorrectPlayer!.seek(Duration.zero);
      await answerinCorrectPlayer!.resume();
    } catch (e) {
      debugPrint('Error during audio playback "answer_incorrect.wav": $e');
    }
  }
}
