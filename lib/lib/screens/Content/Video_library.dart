import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoLibraryScreen extends StatefulWidget {
  @override
  _VideoLibraryScreenState createState() => _VideoLibraryScreenState();
}

class _VideoLibraryScreenState extends State<VideoLibraryScreen> {
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  int _selectedIndex = 0;

  final List<Map<String, String>> _videos = [
    {'title': 'Algebra Lesson 1', 'url': 'https://www.sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4'},
    {'title': 'Chemistry Lab Demo', 'url': 'https://www.sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4'},
    {'title': 'School Sports Day', 'url': 'https://www.sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4'},
    {'title': 'Career Guidance Talk', 'url': 'https://www.sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4'},
  ];

  @override
  void initState() {
    super.initState();
    _initPlayer(0);
  }

  void _initPlayer(int index) async {
    if (_controller != null) {
      await _controller!.dispose();
    }
    _controller = VideoPlayerController.networkUrl(Uri.parse(_videos[index]['url']!))
      ..initialize().then((_) {
        setState(() {});
      });
    setState(() => _selectedIndex = index);
  }

  void _togglePlay() {
    if (_controller == null || !_controller!.value.isInitialized) return;
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
        _isPlaying = false;
      } else {
        _controller!.play();
        _isPlaying = true;
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Library')),
      body: Column(
        children: [
          // Video Player
          Container(
            height: 220,
            color: Colors.black,
            child: _controller != null && _controller!.value.isInitialized
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                      IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          size: 60,
                          color: Colors.white70,
                        ),
                        onPressed: _togglePlay,
                      ),
                      Positioned(
                        bottom: 8,
                        left: 16,
                        child: Text(
                          _videos[_selectedIndex]['title']!,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                : Center(child: CircularProgressIndicator()),
          ),
          // Playlist
          Expanded(
            child: ListView.builder(
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.video_library),
                  title: Text(_videos[index]['title']!),
                  trailing: index == _selectedIndex ? Icon(Icons.check_circle, color: Colors.green) : null,
                  onTap: () {
                    _initPlayer(index);
                    if (_controller != null && _controller!.value.isInitialized) {
                      _controller!.play();
                      setState(() => _isPlaying = true);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}