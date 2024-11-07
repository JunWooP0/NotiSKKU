import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notiskku_demo/notice_functions/launch_url.dart'; // LaunchUrlService import 추가
import 'package:url_launcher/url_launcher.dart';

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});

  Future<void> _openSettings() async {
    if (Platform.isAndroid) {
      // Android 알림 설정 화면으로 이동
      const url = 'app-settings:';
      if (await canLaunch(url)) {
        await launch(url);
      }
    } else if (Platform.isIOS) {
      // iOS 알림 설정 화면으로 이동
      await launch('app-settings:');
    } else {
      print("This platform does not support settings redirection.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final LaunchUrlService launchService =
        LaunchUrlService(); // LaunchUrlService 객체 생성

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/greenlogo_fix.png', width: 40),
        ),
        title: const Text(
          '더보기',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // 타이틀 중앙 정렬
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              children: [
                // 사용자 설정 / 구독 설정 섹션
                _buildSectionDivider(),
                _buildSectionTitle('사용자 설정 / 구독 설정'),
                _buildListItem(context, '  시스템 알림 설정', openSettings: true),
                _buildListItem(context, '  학과 및 키워드 알림 설정'),
                _buildListItem(context, '  학과 및 키워드 편집'),

                // 피드백 섹션
                _buildSectionDivider(),
                _buildSectionTitle('피드백'),
                _buildListItem(context, '  FAQ', showFAQPopup: true),
                _buildListItem(context, '  문의 / 건의', showInquiryPopup: true),
                _buildListItem(context, '  버전 및 공지', showVersionPopup: true),

                // 정보 섹션
                _buildSectionDivider(),
                _buildSectionTitle('정보'),
                _buildListItem(context, '  라이센스'),
                _buildListItem(context, '  개인정보'),
                _buildListItem(context, '  이용 약관'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionDivider() {
    return Divider(
      color: Color(0xFF0B5B42), // 구분선 색상 변경
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title,
      {bool showFAQPopup = false,
      bool showInquiryPopup = false,
      bool showVersionPopup = false,
      bool openSettings = false,}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 19,
          color: Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        if (showFAQPopup) {
          _showPopup(context, 'FAQ', buttonTopPadding: 60.0); // FAQ 팝업
        } else if (showInquiryPopup) {
          _showPopup(context, '문의 / 건의', buttonTopPadding: 55.0); // 문의 / 건의 팝업
        } else if (showVersionPopup) {
          _showPopup(context, '버전 및 공지',
               versionContent: true, buttonTopPadding: 10.0); // 버전 및 공지 팝업
        }
        if(openSettings){
          _openSettings();
        }
      },
    );
  }

  void _showPopup(BuildContext context, String title,
      {bool versionContent = false, double buttonTopPadding = 20.0}) {
    final LaunchUrlService launchService =
        LaunchUrlService(); // LaunchUrlService 객체 생성
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            content: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65, // 65% of screen height
              ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B5B42),
                  ),
                ),
                const Divider(
                  color: Color(0xFF0B5B42),
                  thickness: 3,
                  height: 20,
                ),
                SizedBox(height: title == '버전 및 공지' ? 10 : 15), // 조건에 따른 간격 조절
                if (versionContent) ...[
                  SizedBox(
                    height: 200, // 버전 및 공지사항 내용의 세로 길이 조정
                    child: SingleChildScrollView(
                      child: _buildVersionContent(),
                    ),
                  ),
                ] else ...[
                  _buildOtherContent(title, launchService),
                ],
                SizedBox(height: buttonTopPadding), // 버튼과 콘텐츠 간격 조정
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0B5B42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        '확인',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// 공지사항 내용 외의 다른 내용 생성 함수
  Widget _buildOtherContent(String title, LaunchUrlService launchService) {
    if (title == '문의 / 건의') {
      return Column(
        children: [
          const Text(
            '문의 및 건의는 아래의 카카오톡 오픈채팅을 이용해 주세요.\n답변은 2~3일 정도 소요될 수 있습니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              launchService.launchURL('https://open.kakao.com/o/gKYMY3Wg');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[300],
              child: const Text(
                'https://open.kakao.com/o/gKYMY3Wg',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 15),
          Image.asset(
            'assets/images/fix.png',
            width: 80,
            height: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20),
          Text(
            '서비스 준비 중입니다',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildVersionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '서버 정기점검 (완료)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          '[2024.08.21]',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 5),
        Text(
          '- NotiSKKU 정기점검 완료되었습니다.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        // 첫 번째와 두 번째 공지사항 사이 구분선
        Divider(
          color: Colors.grey[600],
          thickness: 1,
          height: 20, // 구분선 위 아래 간격
        ),

        // 두 번째 공지사항
        Text(
          '서버 정기점검 (완료)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          '[2024.06.15]',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 5),
        Text(
          '- NotiSKKU 서버 점검이 성공적으로 완료되었습니다.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),

        // 두 번째와 세 번째 공지사항 사이 구분선
        Divider(
          color: Colors.grey[600],
          thickness: 1,
          height: 20, // 구분선 위 아래 간격
        ),

        // 세 번째 공지사항
        Text(
          '서버 정기점검 (완료)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          '[2024.04.10]',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 5),
        Text(
          '- NotiSKKU의 점검 작업이 정상적으로 완료되었습니다.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
