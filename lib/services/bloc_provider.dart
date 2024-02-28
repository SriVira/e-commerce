import 'package:ecommerce/bloc/google_signin_bloc.dart';
import 'package:ecommerce/bloc/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<ProductItemsBloc>(create: (context) => ProductItemsBloc()),
    BlocProvider<GoogleLoginBloc>(create: (context) => GoogleLoginBloc()),
  ];
}
