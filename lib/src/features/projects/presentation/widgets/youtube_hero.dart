import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeHero extends StatelessWidget {
  final String videoId;
  const YoutubeHero({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        mute: true, // REQUIRED for autoplay on web
        loop: true,
        strictRelatedVideos: false,
        showVideoAnnotations: false,
        showControls: false,
        showFullscreenButton: false,
        playsInline: true,

      ),
    );

    return YoutubePlayer(
      controller: controller,
      aspectRatio: 16 / 9,
    );
  }
}
