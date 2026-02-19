import 'package:e_commerce_dashboard/features/add_product/domain/entities/product_entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/products_repo/products_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.productsRepo, this.imagesRepo)
    : super(AddProductInitial());

  final ProductsRepo productsRepo;
  final ImagesRepo imagesRepo;

  Future<void> addProduct(ProductEntities addProductInputEntities) async {
    emit(AddProductLoadingState());
    var result = await imagesRepo.uploadImage(addProductInputEntities.image);
    result.fold(
      (f) {
        emit(AddProductErrorState(message: f.message));
      },
      (url) async {
        addProductInputEntities.imageUrl = url;
        print("URL IN CUBIT ${addProductInputEntities.imageUrl}");
        var result = await productsRepo.addProducts(addProductInputEntities);
        result.fold(
          (f) {
            emit(AddProductErrorState(message: f.message));
          },
          (r) {
            emit(AddProductSuccessState());
          },
        );
      },
    );
  }
}
