import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController introduceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Introduce Devils Dev.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/IMG_0001.JPG',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            ///이름 섹션
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      '이름',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('lalahaha Park'),
                ],
              ),
            ),

            ///나이 섹션
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      '나이',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('46'),
                ],
              ),
            ),

            ///메일 섹션
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      '메일',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('devilsdev@gmail.com'),
                ],
              ),
            ),

            ///홈페이지 섹션
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      '웹사이트',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('lalahaha.netlify.app'),
                ],
              ),
            ),

            ///직업 섹션
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      '직업',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('IMC Specialist'),
                ],
              ),
            ),

            ///학력 섹션
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      '학력',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('중앙대학교 대학원'),
                ],
              ),
            ),

            ///MBTI 섹션
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      'MBTI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('INFJ'),
                ],
              ),
            ),

            ///자기소개 입력 필드
            Container(
              margin: EdgeInsets.only(left: 30, top: 16),
              child: Text(
                '자기소개',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: introduceController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
