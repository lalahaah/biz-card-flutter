import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController introduceController = TextEditingController();

  ///자기소개 수정 모드 상태
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    // 위젯이 처음 실행되었을 때 이곳을 호출합니다!
    getIntroduceData();
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, top: 16),
                  child: Text(
                    '자기소개',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 30, top: 16),
                    child: Icon(
                      Icons.mode_edit,
                      color:
                          isEditMode == true ? Colors.blueAccent : Colors.black,
                      size: 24,
                    ),
                  ),
                  onTap: () async {
                    if (isEditMode == false) {
                      setState(() {
                        //update widget
                        isEditMode = true;
                      });
                    } else {
                      //입력 필드 값이 비어있는지 체크(empty check!)
                      if (introduceController.text.isEmpty) {
                        // snackbar 메시지로 사용자에게 안내하기
                        var snackBar = SnackBar(
                          content: Text('자기소개 입력 값이 비어 있습니다.'),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return; //하단의 로직들을 수행하지 않고 여기서 메서드 종료
                      }

                      // 저장 로직 구현 !!
                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setString(
                          'introduce', introduceController.text);

                      setState(() {
                        // update widget
                        isEditMode = false;
                      });
                    }
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: introduceController,
                enabled: isEditMode,
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

  Future<void> getIntroduceData() async {
    //기존에 저장된 자기소개 데이터가 있다면 로드해오기!
    var sharedPref = await SharedPreferences.getInstance();
    String introduceMsg = sharedPref.getString('introduce').toString();
    introduceController.text = introduceMsg ?? "";
  }
}
