import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuis_124200040/detail.dart';
import 'data.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade200,
      appBar: AppBar(
        title: Text("Daftar Produk Penjualan ", style: TextStyle(color:Colors.blueAccent,fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle:true,
        backgroundColor: Colors.yellow.shade300,
      ),
      body:ListView.builder(
        itemBuilder: (context, index){
          final Groceries data = groceryList[index];
          return InkWell(
            highlightColor: Colors.red,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return detail(data: data);
              }));
            },
            child: Container(
              color: Colors.white54,
              padding: EdgeInsets.symmetric(horizontal: 550,vertical: 20),
              child: Card(
                color: Colors.yellow.shade300,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.blueGrey
                  ),
                ),

                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(data.name,
                      style:TextStyle(
                        fontWeight: FontWeight.bold, fontFamily:'Calibri' ,color:Colors.blueAccent,
                        fontSize: 30,
                      ) ,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15,),
                    Image.network(data.productImageUrls[0],
                    width: 400, height: 200,),
                    SizedBox(height: 15,),
                    Text("Ofiicial Store\n${data.storeName}",
                      style:TextStyle(
                        fontWeight: FontWeight.bold,color:Colors.blueAccent,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15,),
                    Text("Harga     : Rp. ${data.price}.000",
                      style:TextStyle(
                        fontWeight: FontWeight.bold,color:Colors.blueAccent,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: groceryList.length,
      ),
    );
  }
}
