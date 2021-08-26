part of 'details.dart';

class DetailRestoran extends StatelessWidget {
  static String routeName = '\detail_restoran';
  final String id;
  const DetailRestoran({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<DetailProvider>(
        create: (context) => DetailProvider(apiService: ApiService(), id: id),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderDetail(),
              BodyDetail(),
            ],
          ),
        ),
      ),
    );
  }
}
