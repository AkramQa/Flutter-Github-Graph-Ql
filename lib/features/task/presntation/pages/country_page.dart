import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/core/presentation/widgets/loader.dart';
import 'package:graphql_task/core/presentation/widgets/screen_loader.dart';
import 'package:graphql_task/core/presentation/widgets/screen_utils.dart';
import 'package:graphql_task/features/task/presntation/bloc/fetch_list/fetch_list_bloc.dart';
import 'package:graphql_task/features/task/presntation/widgets/country_widget.dart';
import 'package:graphql_task/injection.dart';

import '../../data/models/country_model.dart';
@RoutePage()
class CountryPage extends StatefulWidget {
  static const String routePath = '/country';
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> with ScreenLoader,ScreenUtils {
  final FetchListBloc fetchListBloc =getIt<FetchListBloc>();
  @override
  void initState() {

    super.initState();
    fetchListBloc.add(FetchListOnSubmit());
  }
  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchListBloc,FetchListState>(
        bloc: fetchListBloc,
        builder: (context,state){
       if(state is FetchListLoading){
         return const Loader();
       }
       else if (state is FetchListFailure){
         return GestureDetector(
           onTap: (){fetchListBloc.add(FetchListOnSubmit());},
           child: Text("try again"),
         );
       } else if(state is FetchListSuccessful){
         final List<CountryModel> countries = state.countries;
         if (countries.isEmpty){
           return Text("no data foun");
         } else{
           return ListView.builder(
             itemCount: countries.length,
               itemBuilder: (BuildContext context, int index){
             return CountryWidget(country: countries.elementAt(index));
           });
         }
       } else {
         return const SizedBox.shrink();
       }
        }
      )
    );
  }
}
