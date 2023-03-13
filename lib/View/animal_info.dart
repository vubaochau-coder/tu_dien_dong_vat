import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimalInfomationPage extends StatefulWidget {
  const AnimalInfomationPage({super.key});

  @override
  State<AnimalInfomationPage> createState() => _AnimalInfomationPageState();
}

class _AnimalInfomationPageState extends State<AnimalInfomationPage> {
  final FlutterTts flutterTts = FlutterTts();
  final player = AudioPlayer();
  bool isLiked = false;
  bool isPlayed = false;

  speak() async {
    await flutterTts.setLanguage("vi");
    await flutterTts.setPitch(1);
    await flutterTts.speak(
      'Sư tử (Panthera leo) là một trong những loài đại miêu của họ Mèo, chi Báo. Được xếp mức sắp nguy cấp trong thang sách Đỏ IUCN. Trong văn hóa phương Tây, sư tử được mệnh danh là "chúa tể rừng xanh" hay "vua của muôn thú".\nSư tử đực to lớn hơn con cái, phân biệt bằng bộ lông bờm khi chúng đạt độ tuổi trưởng thành nhất định.\nTiếng gầm của một con sư tử có thể được nghe thấy từ cách đó 5 dặm (khoảng 8 km).',
    );
  }

  @override
  void initState() {
    super.initState();

    setAudio();
  }

  setAudio() async {
    player.setReleaseMode(ReleaseMode.loop);
    final playerCache = AudioCache(prefix: 'audio/');
    final url = await playerCache.load('lion.mp3');
    player.setSourceUrl(url.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        leadingWidth: 60,
        leading: Container(
          margin: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white.withOpacity(0.3),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Container(
            width: 56,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white.withOpacity(0.3),
            ),
            child: IconButton(
              onPressed: () {
                isPlayed ? player.pause() : player.resume();
                setState(() {
                  isPlayed = !isPlayed;
                });
              },
              icon: Icon(
                isPlayed ? Icons.pause : Icons.music_note_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset(
              'images/lion_detail.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.black.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Sư tử',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            speak();
                          },
                          icon: const Icon(
                            Icons.volume_up_rounded,
                            color: Colors.white70,
                            size: 32,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          icon: FaIcon(
                            isLiked
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            color: isLiked ? Colors.red[400] : Colors.white,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Sư tử (Panthera leo) là một trong những loài đại miêu của họ Mèo, chi Báo. Được xếp mức sắp nguy cấp trong thang sách Đỏ IUCN. Trong văn hóa phương Tây, sư tử được mệnh danh là "chúa tể rừng xanh" hay "vua của muôn thú".\nSư tử đực to lớn hơn con cái, phân biệt bằng bộ lông bờm khi chúng đạt độ tuổi trưởng thành nhất định.\nTiếng gầm của một con sư tử có thể được nghe thấy từ cách đó 5 dặm (khoảng 8 km).',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
