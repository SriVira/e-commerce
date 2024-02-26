import 'dart:io';

import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductItems extends ProductItemsEvent {
  @override
  List<Object?> get props => [];
}

class ProductItemsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductItemsInitial extends ProductItemsState {}

class ProductItemsLoading extends ProductItemsState {}

class ProductItemsLoaded extends ProductItemsState {
  final List<ProductModel> data;
  ProductItemsLoaded({required this.data});
  @override
  List<Object?> get props => [data];
}

class ProductItemsEmpty extends ProductItemsState {
  final String message;
  ProductItemsEmpty(this.message);
  @override
  List<Object?> get props => [message];
}

class ProductItemsError extends ProductItemsState {
  final String message;
  ProductItemsError(this.message);
  @override
  List<Object?> get props => [message];
}

class ProductItemsBloc extends Bloc<ProductItemsEvent, ProductItemsState> {
  ProductItemsBloc() : super(ProductItemsInitial()) {
    on<ProductItemsEvent>((event, emit) async {
      if (event is GetProductItems) {
        try {
          emit(ProductItemsLoading());
          List<ProductModel> productItems =
              await ProductController.getProducts();
          if (productItems.isNotEmpty) {
            emit(ProductItemsLoaded(data: productItems));
          } else {
            emit(ProductItemsEmpty("No Products Found!"));
          }
        } on SocketException {
          emit(ProductItemsError("No Internet Connection"));
        } on HttpException {
          emit(ProductItemsError("No Service Found"));
        } on FormatException {
          emit(ProductItemsError("Invalid Response Format"));
        } catch (e) {
          emit(ProductItemsError(e.toString()));
        }
      }
    });
  }
}
