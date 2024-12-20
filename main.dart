import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(title: Text('我的自傳'),
        centerTitle: true,),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: currentIndex==0?Image.asset('assets/f1.jpg', width: 40, height: 40,):Image.asset('assets/f1.jpg', width: 30, height: 30,), label: '自我介紹',),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程',),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫',),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向',),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
            if (index==0) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("1.mp3"));
            }
            if (index==1) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("2.mp3"));
            }
            if (index==2) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("3.mp3"));
            }
            if (index==3) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("4.mp3"));
            }
          });
        },
      ),

    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1='我一直認為人生是一段充滿學習和成長的旅程。我的故事起源於一個普通但溫暖的家庭：父親和母親都是在餐飲業工作，家中還有一個哥哥。家裡面的氣氛總是充滿支持與鼓勵。我從小就被教導要負責任，這也成為了塑造我性格的重要因素。'
      '我的學習歷程從一個好奇心旺盛的孩童開始。在小學時，我對所有新鮮事物都充滿興趣，無論是課堂上的自然科學，還是課後參加的體適能社團，這些經歷讓我養成了探索和挑戰自我的習慣。'
      '到了國中，數學和科學逐漸成為我最熱衷的領域。我喜歡解決複雜的問題，也樂於與同學討論課業上的疑難。這不僅提升了我的信心，也讓我開始思考未來是否可以將興趣發展為專業'
      '在高職期間，我不僅專注於課業，同時，我也擔任班級幹部，負責組織各項活動，這讓我學會了溝通與領導的技巧。';
      '展望未來，我希望能將自身所學應用於實際生活，無論是透過進一步的學術研究，還是投身於專業領域解決社會問題。我堅信，只要保持初心與熱忱，所有目標都能逐步實現。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who an I', style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold),),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 15,),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/f1.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/f1.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Screen2'),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大一時期'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 200,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 學好英文'),
                    Text('2. 組合語言'),
                    Text('3. 考取證照'),
                    Text('4. 人際關係'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(),
          SizedBox(height: 10,),
          Row(),
          SizedBox(height: 10,),
          Row(),
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Screen4'),
      ),
    );
  }
}
