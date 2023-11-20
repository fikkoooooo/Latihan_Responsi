import 'package:flutter/material.dart';
import 'package:latihan_responsi_fikko/api_data_source.dart';
import 'package:latihan_responsi_fikko/users_model.dart';

class reports extends StatefulWidget {
  const reports({super.key});

  @override
  State<reports> createState() => _reportsState();
}

class _reportsState extends State<reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REPORTS LIST",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.white54,
      ),
      body: _buildListNewsBody(),
    );
  }


  Widget _buildListNewsBody(){
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadArticles(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              UsersModel usersModel = UsersModel.fromJson(snapshot.data);
              return _buildSuccessSection(usersModel);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildSuccessSection(UsersModel data) {
    return ListView.builder(
        itemCount: data.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return _BuildItemUsers(data.data![index]);
        });
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemUsers(Data UsersModel) {
    return InkWell(
      onTap: (){},
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(UsersModel.image_url!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(UsersModel.title!),
              ],
            )
          ],
        ),
      ),
    );
  }
}
