
import 'package:flutter/material.dart';
import 'package:products/product.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: show(),
    );
  }
}
 class show extends StatefulWidget {
   const show({Key? key}) : super(key: key);
 
   @override
   _showState createState() => _showState();
 }
 
 class _showState extends State<show> {
   late Future<List<Product>> ls;
   late List<Product> _products;
   late bool _loading;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(_loading ? 'Loading.' : 'List'),
       ),
       body: Container(
         color: Colors.white,
         child: ListView.builder(
           itemCount: null == _products ? 0 : _products.length,
             itemBuilder: (context,index){
               Product product = _products[index];SizedBox(height: 50,);
               return Card(
                 child: ListTile(
                 leading: Image.network(product.image),
                 title: Text(product.title),
                   subtitle: Text(product.price.toString()), content: Text(product.price.toString()),
                 trailing: Icon(Icons.add_shopping_cart ),
                   onTap: () =>   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const SoLuong()),
                   )
                 //print("Da tap vao")

               ),
               );
             }),
       ),

       // body: FutureBuilder(
       //  // future: _products,
       //   builder: (BuildContext context,
       //       AsyncSnapshot<List<Product>> snapshot) {
       //     if (snapshot.hasData) {
       //       var data = snapshot.data;
       //       return ListView.builder(
       //         itemCount: data!.length,
       //         itemBuilder: (BuildContext context, int index) {
       //           Product p = data[index];
       //           return ListTile(
       //             // leading: Image.network(p.thumbnailUrl),
       //             title: Text(p.title),
       //
       //           );
       //         },
       //       );
       //     } else {
       //       return CircularProgressIndicator();
       //     }
       //   },
       //
       // ),
     );
   }

   @override
   void initState() {
     super.initState();
     _loading = true;
     Product.fetchdata().then((products) {
       setState(() {
         _products = products;
         _loading = false;
       });
     });
   }
 }
class SoLuong extends StatelessWidget {
  const SoLuong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Chon so luong:"),
      ),
      body: Center(
        child: Column(
          children: [
          SizedBox(height: 50,),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              icon: Icon(Icons.add),
              hintText: "Nhap so luong can mua",
              labelText:"So luong"
          ),
        ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back list'),
            ),]),

      ),
    );
  }
}
