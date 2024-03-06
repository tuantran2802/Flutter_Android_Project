import 'package:flutter/material.dart';

class MyClassPage extends StatelessWidget {
  MyClassPage({super.key});

  List<ListClassItem> lsClassItem = [
    ListClassItem(className: "Quản trị dự án phần mềm",
      teacherName: "Hân Nguyễn Mậu",
      image: 'assets/image/hinh1.jpg',),
    ListClassItem(className: "Lập trình ứng dụng di động",
      teacherName: "Nguyễn Dũng",
      image: 'assets/image/hinh2.jpg',),
    ListClassItem(className: "Lập trình hướng đối tượng",
      teacherName: "Trương Công Tuấn",
      image: 'assets/image/hinh3.jpg',),
    ListClassItem(className: "Ngôn ngữ truy vấn có cấu trúc",
      teacherName: "Phương Chi Trần",
      image: 'assets/image/hinh4.jpg',),
    ListClassItem(className: "Java nâng cao",
      teacherName: "Hà Nguyễn Hoàng",
      image: 'assets/image/hinh5.jpg',),
    ListClassItem(className: "Mẫu thiết kế",
      teacherName: "Trung Nguyễn Văn",
      image: 'assets/image/hinh6.jpg',),
    ListClassItem(className: "Cấu trúc dữ liệu và giải thuật",
      teacherName: "Quang Hoàng",
      image: 'assets/image/hinh7.jpg',),
    ListClassItem(className: "Mạng máy tính",
      teacherName: "Nguyễn Ngọc Thủy",
      image: 'assets/image/hinh8.jpg',),
  ];


  List<ListMenuClassItem> lsMenuClass = [
    ListMenuClassItem(icon: "H",
        className: "Quản trị dự án phần mềm",
        teacherName: "Hân Nguyễn Mậu",
        color: Colors.blue),
    ListMenuClassItem(icon: "D",
        className: "Lập trình ứng dụng di động",
        teacherName: "Nguyễn Dũng",
        color: Colors.green),
    ListMenuClassItem(icon: "T",
        className: "Lập trình hướng đối tượng",
        teacherName: "Trương Công Tuấn",
        color: Colors.orange),
    ListMenuClassItem(icon: "C",
        className: "Ngôn ngữ truy vấn có cấu trúc",
        teacherName: "Phương Chi Trần",
        color: Colors.pink),
    ListMenuClassItem(icon: "H",
        className: "Java nâng cao",
        teacherName: "Hà Nguyễn Hoàng",
        color: Colors.purple),
    ListMenuClassItem(icon: "T",
        className: "Mẫu thiết kế",
        teacherName: "Trung Nguyễn Văn",
        color: Colors.grey),
    ListMenuClassItem(icon: "Q",
        className: "Cấu trúc dữ liệu và giải thuật từ cơ bản đến nâng cao",
        teacherName: "Quang Hoàng",
        color: Colors.brown),
    ListMenuClassItem(icon: "T",
        className: "Mạng máy tính",
        teacherName: "Nguyễn Ngọc Thủy",
        color: Colors.red),
  ];
   List<String> popMenuString = [
           "gui y kien phan hoi cho google", "khac"
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Google ",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Classroom",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
            IconButton(
                onPressed: (){

                },
              icon: Icon(
                Icons.account_circle_rounded
              ),
            ),
            PopupMenuButton(
                itemBuilder: (context){
                  var ls =popMenuString.map((e){
                    return PopupMenuItem(
                        child: Text(e),
                        onTap: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("hahahaha ${e}")
                            ),
                          );
                        },
                    );

                  }).toList();
                  return ls;
                },
            ),
          ],
        ),
      ),
      drawer: new Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // title
                Container(
                  padding: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .padding
                      .top),
                  margin: EdgeInsets.fromLTRB(20, 30, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        "G",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "o",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "o",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "g",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "l",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "e",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        " Classroom",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                // Tạo thanh ngang
                Container( // tạo thanh ngang
                  height: 1,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, style: BorderStyle.solid),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  leading: const Icon(
                    Icons.home_outlined,
                  ),
                  title: const Text(
                    "Lớp học",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  leading: const Icon(Icons.calendar_today),
                  title: const Text(
                    "Lịch",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                //Tạo thanh ngang
                Container( // tạo thanh ngang
                  height: 1,
                  margin: EdgeInsets.fromLTRB(70, 20, 0, 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, style: BorderStyle.solid),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  title: const Text(
                    "ĐÃ ĐĂNG KÝ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  leading: const Icon(Icons.fact_check_outlined),
                  title: const Text(
                    "Việc cần làm",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                    child: Column(
                      children: lsMenuClass.map((e) {
                        return ListTile(
                            onTap: () {

                            },
                            leading: FloatingActionButton.small(
                              child: Text(
                                e.icon,
                                style: TextStyle(fontSize: 12.0),
                              ),
                              onPressed: () {},
                              backgroundColor: e.color,
                            ),
                            title: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.className,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    e.teacherName,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        );
                      }).toList(),
                    )
                ),
                //Tạo thanh ngang
                Container( // tạo thanh ngang
                  height: 1,
                  margin: EdgeInsets.fromLTRB(70, 20, 0, 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, style: BorderStyle.solid),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  leading: const Icon(
                    Icons.arrow_circle_down_outlined,
                  ),
                  title: const Text(
                    "Lớp học đã lưu trữ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  leading: const Icon(
                    Icons.folder_open_outlined,
                  ),
                  title: const Text(
                    "Thư mục của lớp học",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  leading: const Icon(
                    Icons.settings_outlined,
                  ),
                  title: const Text(
                    "Cài đặt",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  leading: const Icon(
                    Icons.help_outline_outlined,
                  ),
                  title: const Text(
                    "Trợ giúp",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 625,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: lsClassItem.map((e) {
                  return Container(
                      height: 160,
                      // width: double.infinity,
                      // color: Colors.blue[900],
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new ExactAssetImage(e.image),
                          fit: BoxFit.cover,),
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.className,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              PopupMenuButton(
                                  color: Colors.white,
                                  icon: const Icon(Icons.more_horiz),
                                  itemBuilder: (context) =>
                                  [
                                    PopupMenuItem(child: Row(
                                      children: [
                                        Text(
                                          "Hủy đăng ký",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),)
                                      ],
                                    ))
                                  ]
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                e.teacherName,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  );
                }).toList(),
              ),
            ),

          ],

        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60, right: 20),
        child: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          backgroundColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,

    );
  }
}

class ListClassItem{
  late String className;
  late String teacherName; // late khai báo biến chưa được khởi tạo
  late String image;
  ListClassItem(
      {required this.className,
        required this.teacherName,
        required this.image,});
}

class ListMenuClassItem{
  late String icon;
  late String className;
  late String teacherName;
  late Color color;
  ListMenuClassItem(
      {
        required this.icon,
        required this.className,
        required this.teacherName,
        this.color = Colors.blue
      }
      );
}