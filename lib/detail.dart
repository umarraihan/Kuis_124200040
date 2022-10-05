import 'package:flutter/material.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';
class detail extends StatefulWidget {
  final Groceries data;

  const detail({Key? key, required this.data}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  bool toggle = false;
  Color change_color = Colors.blueAccent.shade200;
  Color change_warna = Colors.yellow.shade300;

  favorite(toggle){
    if(toggle=true) {
      setState(() {
        change_color = Colors.yellow.shade300;
        change_warna = Colors.blueAccent.shade200;
      });
    }else if(toggle=false){
      setState((){
        change_color = Colors.white54;
      });
    }

    else{
      change_color = Colors.yellow;
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: change_color,
      appBar: AppBar(
        title: Text("${widget.data.name}",
        style: TextStyle(color: change_color,
        fontSize: 20,fontWeight: FontWeight.bold,)
        ), centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                toggle = !toggle;
                favorite(toggle);
              });
            },
            icon: (toggle)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          )
        ],
        backgroundColor: change_warna,
      ),
      body: ListView(

        children: [
          Container(
            color: Colors.white54,
            alignment: Alignment.center,
            height: (MediaQuery
                .of(context)
                .size
                .height) / 3,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.data.productImageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.data.productImageUrls[index],
                      width: 200,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white54,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Card(

              color: change_warna,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Colors.blueGrey
                ),
              ),
              child: ListView(

                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                children: [
                  SizedBox(height: 40,),
                  Text(widget.data.name,
                    style: TextStyle(color:change_color,
                      fontSize: 27,fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(widget.data.description,
                      style: TextStyle(color:change_color,
                        fontSize: 20,fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,),
                  ),
                  SizedBox(height: 30,),
                  Text("Harga                  :  ${widget.data.price}",
                    style: TextStyle(color:change_color,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 30,),
                  Text("Discount             :  ${widget.data.discount}",
                    style: TextStyle(color:change_color,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 15,),
                  Text("Official Store      :  ${widget.data.storeName}",
                    style: TextStyle(color:change_color,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 15,),
                  Text("Stock                   :  ${widget.data.stock}",
                    style: TextStyle(color:change_color,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 15,),
                  Text("Reviews              :  ${widget.data.reviewAverage} ",
                    style: TextStyle(color:change_color,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 40,),
                  Container(
                    color: Colors.white54,
                    padding: EdgeInsets.only(right: 100,left: 100,) ,
                    height: 50,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            primary: change_color
                        ),
                      onPressed: (){
                          _launchURL(widget.data.productUrl);
                       },
                        child: Text("Ingin Melakukan Pemesanan",
                            style: TextStyle(color:change_warna,
                              fontSize: 20,fontWeight: FontWeight.bold,))),

                  ),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          )
        ],

      ),
    );
  }
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}

