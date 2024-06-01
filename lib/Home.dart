import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _showLogo = true;
  bool light = true;

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
    if (_scrollController.offset <=200) {
        
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
                title: _showLogo
                    ? 
                    Container(
                        height: 43,
                        width: double.infinity,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 195, 36, 34)),
                        child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The weeknd",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Proxima Nova',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 2,
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
                            ),
                            IconButton(
                              onPressed: (){},
                               icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 15,
                                )
                               )
                          ],
                        )
                        )
                    : 
                    Container(
                        height: 43,
                        width: double.infinity,
                        padding: EdgeInsets.only(right: 7,left:50,top: 7,bottom: 7 ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 195, 36, 34)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/image.png'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The weeknd",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Proxima Nova',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 2,
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
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                  size: 15,
                                ))
                          ],
                        )
                        )
                    ,
                background: Image.asset(
                  'assets/image.png',
                  fit: BoxFit.fill,
                )),
            expandedHeight: 300,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),

          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 20,
          //     child: Center(
          //       child: Text('Scroll to see the SliverAppBar in effect.'),
          //     ),
          //   ),
          // ),

          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 200,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...Read more',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text('Media,docs and links',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                       IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 25,
                          weight: 80,
                        ),
                      )
                    ],
                  ),
                  Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160,
                color: Colors.red,
              ),
              Container(
                width: 160,
                color: Colors.blue,
              ),
              Container(
                width: 160,
                color: Colors.green,
              ),
              Container(
                width: 160,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                color: Colors.orange,
              ),
            ],
          ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mute notification'),
                        Switch(
                        activeColor: Colors.amber,
                        activeTrackColor: Colors.cyan,
                        inactiveThumbColor: Colors.blueGrey.shade600,
                        inactiveTrackColor: Colors.grey.shade400,
                        splashRadius: 50.0,
                        value:light,
                        onChanged: (val) {
                           setState(() {
                            light = val;
                          });
                        },
                      ),
                      ],
                    ),
                    Row(
                      children: [
                        // Icon(Icon.clear),
                        Text('clear chat')
                      ],
                    ),
                    Row(
                      children: [
                        // Icon(Icon.lock),
                        Text('Encryption')
                      ],
                    ),
                    Row(
                      children: [
                        // Icon(Icon.),
                        Text('Exit ')
                      ],
                    ),
                    Row(
                      children: [
                        // Icon(Icon.),
                        Text('Report')
                      ],
                    )
                ],
              ),
            ),
            
            Container(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Members',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_sharp,
                        size: 30,
                        weight: 80,
                      ),
                    )
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/image.png'),
                        ),
                        Column(
                          children: [Text('Yashika'), Text('29,India')],
                        ),

                          ]
                        )
                      ),
                      
                      ElevatedButton(
                        onPressed: (){},
                         child: Text('Add'))
                    ],
                  ),
                )
              ]),
            ),
          ]))
        ], //<Widget>[]
      ),
    );
  }
}
