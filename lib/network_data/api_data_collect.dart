import 'package:flutter/material.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/model/product_categories_model.dart';
import 'package:pendu_customer/model/vehical_model.dart';

class ApiDataCollect extends StatefulWidget {
  const ApiDataCollect({Key key}) : super(key: key);

  @override
  _ApiDataCollectState createState() => _ApiDataCollectState();
}

class _ApiDataCollectState extends State<ApiDataCollect> {
  List<ProductCategoriesList> _pClist;

  List<VehicalModelList> _vList;
  @override
  void initState() {
    // _getlProductCategoryInfo();
    _getVehicalModelInfo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getlProductCategoryInfo() async {
    var pCategoriesModel = CallApi(context).callProductCategoryApi();
    pCategoriesModel.then((value) {
      setState(() {
        _pClist = value.productCategoriesList.toList();
        print(_pClist);
      });
    });
  }

  void _getVehicalModelInfo() async {
    var vModel = CallApi(context).callVehicalDataApi();
    vModel.then((value) {
      setState(() {
        _vList = value.vehicalModelList.toList();
        print(_vList);
      });
    });
  }

  Future buildText() {
    return Future.delayed(Duration(seconds: 3), () => print('waiting...'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: FutureBuilder(
              future: buildText(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    _vList != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _vList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 200,
                        child: Text(
                          _vList[index].title,
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
