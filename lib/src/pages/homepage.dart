import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  _bottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/icons/home-active.png'),
              onPressed: () => {},
            ),
            IconButton(
              icon: Image.asset('assets/icons/wallets.png'),
              onPressed: () => {},
            ),
            SizedBox(),
            IconButton(
              icon: Image.asset('assets/icons/reports.png'),
              onPressed: () => {},
            ),
            IconButton(
              icon: Image.asset('assets/icons/settings.png'),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }

  _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Your balance', style: TextStyle(color: Colors.grey, fontSize: 17.0)),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('\$ 926.21', style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
            Stack(
              children: <Widget>[
                Image.asset('assets/people/ppl.png'),
                Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.only(left: 23.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.white, width: 10.0)
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  _payCard({
    List<Color> colors
  }) {
    return Container(
      height: 180.0,
      width: 300.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
          stops: [0.0, 1.0]
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset('assets/visa-pay-logo.png'),
              Spacer(),
              Icon(Icons.more_horiz, color: Colors.white)
            ],
          ),
          Text(
            '* * * *  * * * *  * * * *  8014',
            style: TextStyle(
              fontSize: 21.5,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('CARD HOLDER', style: TextStyle(color: Colors.white70)),
                  Text('EXPIRES', style: TextStyle(color: Colors.white70))
                ],
              ),
              SizedBox(height: 7.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Lindsey Johnson', style: TextStyle(color: Colors.white, fontSize: 18.4, fontWeight: FontWeight.bold)),
                  Text('08/21', style: TextStyle(color: Colors.white, fontSize: 18.4, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _carouselSlider() {
    return CarouselSlider(
      items: <Widget>[
        _payCard(colors: [Color(0xFF5AD9B3), Color(0xFF5EDDB7)]),
        _payCard(colors: [Color(0xFF8676FB), Color(0xFFAB7BFF)]),
        _payCard(colors: [Color(0xFFF5A25F), Color(0xFFFAA865)]),
      ],
      options: CarouselOptions(
        height: 180.0,
        initialPage: 1,
        enableInfiniteScroll: false,
        enlargeCenterPage: true
      ),
    );
  }

  _sentCard({
    Image photo,
    String name,
    String date,
    String ammount
  }) {
    return Card(
      child: ListTile(
        leading: Container(
          height: 40.0,
          child: photo,
        ),
        trailing: Text('\$ $ammount', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        title: Row(
          children: <Widget>[
            Text('to: ', style: TextStyle(color: Colors.black38)),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        subtitle: Text(date),
      ),
    );
  }

  _labelHeader( String title ) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Colors.grey
        ),
      ),
    );
  }

  _listSentCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _labelHeader('Today'),
        _sentCard(
          photo: Image.asset('assets/people/rebecca.png'),
          name: 'Rebecca Moore',
          date: '20 January, 2019',
          ammount: '972.00'
        ),
        _labelHeader('Yesterday'),
        _sentCard(
          photo: Image.asset('assets/people/franz.png'),
          name: 'Franz Ferdinand',
          ammount: '125.00',
          date: '19 January, 2019'
        ),
        _sentCard(
          photo: Image.asset('assets/people/john.png'),
          name: 'John Doe',
          date: '19 January, 2019',
          ammount: '247.50'
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () => {},
        child: Image.asset('assets/icons/send.png'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25.0),
                child: _header()
              ),
              _carouselSlider(),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.red,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(fontSize: 18.4, fontWeight: FontWeight.bold),
                      tabs: <Widget>[
                        Tab(text: 'Sent'),
                        Tab(text: 'Received')
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 35.0,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF0F1F4),
                          filled: true,
                          hintText: 'Search transaction',
                          hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                          isDense: true,
                          border: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none
                          ),
                          suffixIcon: Icon(Icons.search)
                        ),
                      ),
                    ),
                    _listSentCards()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}