import 'package:RecipeApp/screens/categorypage/components/category_list_page.dart';
import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    Key key,
    @required this.icon,
  }) : super(key: key);

  final List<IconData> icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                //physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListPage(
                        heading: icon[index].toString(),
                      ),
                    ),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Icon(icon[index]),
                        ),
                        Container(
                          child: Text("${icon[index]}"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
