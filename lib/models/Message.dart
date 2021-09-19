import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'app_name': 'IMM to CA',
          'home_page_title': 'Immigrate to Canada',
          'navigation_label_living': 'Living',
          'navigation_label_study': 'Study',
          'navigation_label_immigration': 'Immigration',
          'navigation_qestion_answer': 'Q&A',
          'introduction': 'Introduction',
          'eligibility': 'Eligibility',
          'documents': 'Documents',
          'processTime': 'ProcessTime: about ',
          'cost': 'cost: ',
          'application website': 'Application website',
          'guide website': 'Guide website',
        },
        'zh': {
          'app_name': '移民加拿大',
          'home_page_title': '移民加拿大',
          'navigation_label_living': '生活',
          'navigation_label_study': '学习',
          'navigation_label_immigration': '移民',
          'navigation_qestion_answer': '问答',
          'introduction': '介绍',
          'eligibility': '必要条件',
          'documents': '所需文件',
          'processTime': '处理时间大约: ',
          'cost': '花费: ',
          'application website': '申请网站',
          'guide website': '指导网站',
        }
      };
}
