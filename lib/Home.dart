import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _showLogo = false;
  bool light = true;
  bool SearchbarShow = false;
  bool expanded = true;
  bool addandfoll = true;

  List<bool> list = [
    false,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset <= 180) {
      setState(() {
        _showLogo = true;
      });
    } else {
      setState(() {
        _showLogo = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(245, 255, 255, 255),
          statusBarIconBrightness: Brightness.dark,
        ),
        toolbarHeight: 0,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            pinned: true,
            floating: true,
            titleSpacing: 0.0,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: EdgeInsets.all(0),
                title:
                    // _showLogo
                    //     ?
                    Container(
                        height: 70,
                        width: double.infinity,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 195, 36, 34)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _showLogo
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "The weeknd",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Proxima Nova',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Community • +11K Members",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Proxima Nova',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )
                                : Expanded(
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                            padding: EdgeInsets.only(
                                              left: 40,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage(
                                                      'assets/image.png'),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "The weeknd",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'Proxima Nova',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        "Community • +11K Members",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Proxima Nova',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ]),
                                              ],
                                            )))),
                            _showLogo
                                ? IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 15,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      showModalBottomSheet<void>(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                          ),
                                          builder: (BuildContext context) {
                                            return Container(
                                                padding: EdgeInsets.all(20),
                                                height: 160,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.link),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Invite',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons
                                                            .person_add_alt_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text('Add member',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons
                                                            .group_add_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text('Add group',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))
                                                      ],
                                                    )
                                                  ],
                                                ));
                                          });
                                    },
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                      size: 20,
                                    ))
                          ],
                        )),
                background: Image.asset(
                  'assets/image.png',
                  fit: BoxFit.fill,
                )),
            expandedHeight: 400,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 8,
            ),
            SearchbarShow
                ? Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(136, 162, 161, 161),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search member',
                              border: InputBorder.none,
                              // border: OutlineInputBorder(),
                            ),
                          ),
                        )),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              SearchbarShow = false;
                            });
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w500),
                              maxLines: expanded ? 3 : null,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  expanded = !expanded;
                                });
                              },
                              child: Text(
                                expanded ? '...Read more' : 'Read less',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Outerdoor',
                                  style: TextStyle(color: Colors.red),
                                ),
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Outerdoor',
                                  style: TextStyle(color: Colors.red),
                                ),
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Outerdoor',
                                  style: TextStyle(color: Colors.red),
                                ),
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Outerdoor',
                                  style: TextStyle(color: Colors.red),
                                ),
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '+1',
                                  style: TextStyle(color: Colors.red),
                                ),
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Media,docs and links',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 23,
                                    weight: 80,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              // margin: const EdgeInsets.symmetric(vertical: 20),
                              height: 137,
                              child: ListView(
                                // This next line does the trick.
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                      width: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset('assets/image.png',
                                            fit: BoxFit.fill),
                                      )),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                      width: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset('assets/image.png',
                                            fit: BoxFit.fill),
                                      )),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                      width: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset('assets/image.png',
                                            fit: BoxFit.fill),
                                      )),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                      width: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset('assets/image.png',
                                            fit: BoxFit.fill),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mute notification',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                ),
                                Transform.scale(
                                  scale:
                                      0.6, // Adjust the scale factor as needed
                                  child: Switch(
                                    activeColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    activeTrackColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    inactiveThumbColor: Colors.grey.shade400,
                                    inactiveTrackColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    splashRadius: 50.0,
                                    value: light,
                                    onChanged: (val) {
                                      setState(() {
                                        light = val;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  size: 25,
                                ),
                                Text(
                                  'clear chat',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.lock_open_outlined,
                                  size: 25,
                                ),
                                Text(
                                  'Encryption',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.exit_to_app_outlined,
                                  size: 25,
                                  color: Colors.red,
                                ),
                                Text(
                                  'Exit community',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.thumb_down_alt_outlined,
                                  size: 25,
                                  color: Colors.red,
                                ),
                                Text(
                                  'Report',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Members',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    SearchbarShow = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.search_sharp,
                                  size: 25,
                                  weight: 80,
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ],
                  )),
            // Container(
            //     padding: EdgeInsets.only(left: 20, right: 20),
            //     child: Column(children: [

            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[0] = !list[0];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[0]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[0] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[1] = !list[1];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[1]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[1] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[2] = !list[2];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[2]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[2] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[3] = !list[3];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[3]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[3] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[4] = !list[4];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[4]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[4] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[5] = !list[5];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[5]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[5] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[6] = !list[6];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[6]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[6] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[7] = !list[7];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[7]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[7] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[8] = !list[8];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[8]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[8] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[9] = !list[9];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[9]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[9] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[10] = !list[10];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[10]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[10] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Yashika',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '29,India',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ])),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              list[11] = !list[11];
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: list[11]
                                    ? Color(0xFFEF456F)
                                    : Colors.grey.shade400,
                              ),
                              child: Text(
                                list[11] ? 'Add' : 'Following',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              )),
                        ),
                      ],
                    ),
                    
                  ],
                ))
          ]))
        ], //<Widget>[]
      ),
    );
  }
}
