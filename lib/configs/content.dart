import 'package:flutter/material.dart' show IconData, Icons;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Content {
  Content._();

  static const profile1 = "👋 Hi, I'm James";
  static const profile2 = "Your Flutter Expert";

  static const headerServices = 'Services 🚀';
  static const services = [
    ServiceModel(
      icon: Icons.phone_android_outlined,
      text: 'App development for mobile and desktop',
    ),
    ServiceModel(
      icon: Icons.emoji_emotions_outlined,
      text: 'Support from concept to launch & beyond',
    ),
    ServiceModel(
      icon: MdiIcons.handshakeOutline,
      text: 'Consultation for com-\npanies of all sizes',
    ),
    ServiceModel(
      icon: Icons.code,
      text: 'Feature implementation',
    ),
    ServiceModel(
      icon: Icons.architecture,
      text: 'Software\nArchitecture',
    ),
    ServiceModel(
      icon: MdiIcons.bug,
      text: 'Bug squashing & app optimization',
    ),
  ];

  static const headerAbout = 'About Me 👨‍💻';
  static const about = [
    "I am one of Germany's few experienced Flutter developers, fluttering since 2018 and regularly contributing to the community.",
    "I've worked with Google Developer Experts, ex-Flutter Team members and Flutter experts from around the world.",
    "I'm a problem solver who translates business needs into scalable software solutions, delivering quality code & clean architectures.",
  ];

  static const headerSuccessStories = 'Success Stories 🏆';
  static const successStories = [
    'Development of an educational app for children featured on the Apple AppStore',
    'Development of a mobile BubbleShooter game awarded best of by Google Play',
    'Development of a white label B2B app which later pivoted to the B2C market',
    'Development of an innovative macOS productivity app from prototype to beta',
  ];

  static const headerContact = "Let's work together 🙌";
  static const contactLinks = [
    ContantModel(
      icon: MdiIcons.email,
      url: 'mailto:james@flutterexpert.dev',
    ),
    ContantModel(
      icon: MdiIcons.linkedin,
      url: 'https://linkedin.com/in/jamesjleahy',
    ),
    ContantModel(
      icon: MdiIcons.github,
      url: 'https://github.com/defuncart',
    ),
    ContantModel(
      icon: MdiIcons.twitter,
      url: 'https://twitter.com/defuncart',
    ),
  ];

  static const hireMe = 'Hire Me';

  static const footer = 'Made with \u2764  in Berlin using ';

  static const impressum = 'Impressum';
  static const datenschutz = 'Datenschutz';

  static const copyright = '© 2022 James Leahy';
}

class ServiceModel {
  const ServiceModel({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;
}

class ContantModel {
  const ContantModel({
    required this.icon,
    required this.url,
  });

  final IconData icon;
  final String url;
}
