import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var versionNumber = "1.0.4";
  static const String appLink = "https://play.google.com/store/apps/details?id=com.MRcode.Fitness";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Text(
                    "Social Links",
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0Xff000725)),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Wrap(
                  spacing: 0.0,
                  // gap between adjacent chips
                  runSpacing: 10.0,
                  // ga
                  runAlignment: WrapAlignment.center,
                  // p be
                  alignment: WrapAlignment.center,

                  /// tween lines
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: socialMediaLinks("Github", 'assets/images/github.png', "https://github.com/AhmedHussein22"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: socialMediaLinks("LinkedIn", 'assets/images/linkedin.png', "https://www.linkedin.com/in/ahmed-hussein-66b1b71a5"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: socialMediaLinks("Twitter", 'assets/images/twitter.png', "https://twitter.com/Engahmedhussei6"),
                    ),
                    MaterialButton(
                      textColor: Colors.black87,
                      color: Colors.blue[500],
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                              )),
                          Text(
                            "Rate the app",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => launchURL(appLink),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Version: $versionNumber",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0Xff000725)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Made",
                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0Xff000725)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                      Text(
                        "in Egypt",
                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0Xff000725)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget header() => Ink(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage("assets/images/me.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Text(
                        'Ahmed Hussein',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0Xff000725)),
                      ),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Color(0XFFff2fc3),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.mail,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                onPressed: () => launchURL("mailto:Ahmed.dev229@gmail.com?subject=Contact query from: Fitness App&body=Hi Annsh, \n"),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        ),
      );

  Widget socialMediaLinks(String label, String imagePath, String url) => MaterialButton(
        textColor: Colors.black87,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 14.0,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        onPressed: () => launchURL(url),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      );
}

launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
