import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/data/models/new_images_models.dart';
import 'package:news_project/src/ui/widgets/get_flag.dart';

import '../../../data/models/currency_news_model.dart';
import '../../../presentation/blocs/currencyNewsBloc/currency_news_bloc.dart';
import '../../../presentation/blocs/imagesBloc/images_bloc.dart';
import '../../drawer/draver_page.dart';

class NewImagePage extends StatefulWidget {
  const NewImagePage({Key? key}) : super(key: key);

  @override
  State<NewImagePage> createState() => _NewImagePageState();
}

class _NewImagePageState extends State<NewImagePage> {
  @override
  Widget build(BuildContext context) {
    context.read<ImagesBloc>().add(FetchImagesEvent());

    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Colors.white,
      color: Colors.black,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(Duration(microseconds: 1500));
      },
      child: Scaffold(
        drawer: const Drawer(
          child: DrawerPage(),
        ),
        appBar: AppBar(
          title: Text("New Images "),
        ),
        body: BlocConsumer<ImagesBloc, ImagesState>(
          listener: (context, state) {
            // Navigator.
          },
          builder: (context, state) {
            if (state is ImagesInitialState) {
              return buildLoading();
            }
            if (state is ImagesLodingState) {
              return buildLoading();
            }
            if (state is ImagesLodedState) {
              return buildUI(state.images);
            }
            if (state is ImagesErrorState) {
              return buildError(state.messages);
            }
            return Container(
              child: Text("Hatolik topilmadi"),
            );
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildUI(List<NewImages> images) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Image.network(images[index].urls!.small.toString()),
            Text("Shu yerlarda rasimlar bor"),
          ],
        );
      },
    );
  }

  Widget buildError(String error) {
    return Center(
        child: Text(
      error,
      style: const TextStyle(fontSize: 24),
    ));
  }
}
