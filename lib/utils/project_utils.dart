class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
      image: "assets/projects/snake.jpeg",
      title: 'Snake Game ',
      subtitle: 'This is an Snake game for students to play.',
      androidLink:
          'https://github.com/Alokkumar2003-Coder/SnakeGame-using-Java-and-JSwing'),
  ProjectUtils(
    image: 'assets/projects/lg.jpeg',
    title: 'Login Page with firebase',
    subtitle: 'This is an App clone.',
    webLink: 'https://loginuiclone.netlify.app/',
  ),
  ProjectUtils(
    image: 'assets/projects/wtsp.jpeg',
    title: 'WhatsApp UI/UX Design',
    subtitle: 'This is an App clone.',
    webLink: 'https://whtsplandingpage.netlify.app/',
  ),
  ProjectUtils(
    image: 'assets/projects/hspt.jpeg',
    title: 'Hospital Management',
    subtitle: 'This is an App clone.',
    webLink:
        'https://github.com/Alokkumar2003-Coder/HospitalManagement-using-Java-JDBC-and-MySql-Database.',
  ),
];
