import 'package:dartz/dartz.dart';
import 'package:feven/core/error/exceptions.dart';
import 'package:feven/core/error/failures.dart';
import 'package:feven/core/network/network_info.dart';
import 'package:feven/features/product/data/datasources/product_local_data_source.dart';
import 'package:feven/features/product/data/datasources/product_remote_data_source.dart';
import 'package:feven/features/product/data/models/Product_model.dart';
import 'package:feven/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteDataSource {}

class MockLocalDataSource extends Mock implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ProductRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    registerFallbackValue(ProductModel(
      id: 1,
      name: 'Test',
      description: 'Test',
      imageUrl: 'test.jpg',
      price: 100,
    ));
  });

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getAllProducts', () {
    final tProductModels = [
      ProductModel(
        id: 1,
        name: 'Test Product',
        description: 'Test Description',
        imageUrl: 'test.jpg',
        price: 100.0,
      )
    ];

    test('should check if the device is online', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getAllProducts()).thenAnswer((_) async => tProductModels);
      when(() => mockLocalDataSource.cacheProducts(any())).thenAnswer((_) async => {});

      await repository.getAllProducts();

      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call to remote data source is successful', () async {
        when(() => mockRemoteDataSource.getAllProducts()).thenAnswer((_) async => tProductModels);
        when(() => mockLocalDataSource.cacheProducts(any())).thenAnswer((_) async => {});

        final result = await repository.getAllProducts();

        expect(result, equals(Right(tProductModels)));
        verify(() => mockRemoteDataSource.getAllProducts());
        verify(() => mockLocalDataSource.cacheProducts(tProductModels));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        when(() => mockRemoteDataSource.getAllProducts()).thenThrow(ServerException());

        final result = await repository.getAllProducts();

        expect(result, equals(Left(ServerFailure())));
        verify(() => mockRemoteDataSource.getAllProducts());
        verifyZeroInteractions(mockLocalDataSource);
      });
    });

    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return last locally cached data when the cached data is present', () async {
        when(() => mockLocalDataSource.getLastProducts()).thenAnswer((_) async => tProductModels);

        final result = await repository.getAllProducts();

        expect(result, equals(Right(tProductModels)));
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getLastProducts());
      });

      test('should return cache failure when there is no cached data present', () async {
        when(() => mockLocalDataSource.getLastProducts()).thenThrow(CacheException());

        final result = await repository.getAllProducts();

        expect(result, equals(Left(CacheFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getLastProducts());
      });
    });
  });

  group('getProductById', () {
    final tId = 1;
    final tProductModel = ProductModel(
      id: tId,
      name: 'Test Product',
      description: 'Test Description',
      imageUrl: 'test.jpg',
      price: 100.0,
    );

    test('should check if the device is online', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getProductById(any())).thenAnswer((_) async => tProductModel);

      await repository.getProductById(tId);

      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call to remote data source is successful', () async {
        when(() => mockRemoteDataSource.getProductById(tId)).thenAnswer((_) async => tProductModel);

        final result = await repository.getProductById(tId);

        expect(result, equals(Right(tProductModel)));
        verify(() => mockRemoteDataSource.getProductById(tId));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        when(() => mockRemoteDataSource.getProductById(tId)).thenThrow(ServerException());

        final result = await repository.getProductById(tId);

        expect(result, equals(Left(ServerFailure())));
        verify(() => mockRemoteDataSource.getProductById(tId));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return locally cached data when the product is present in cache', () async {
        when(() => mockLocalDataSource.getLastProducts()).thenAnswer((_) async => [tProductModel]);

        final result = await repository.getProductById(tId);

        expect(result, equals(Right(tProductModel)));
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getLastProducts());
      });

      test('should return cache failure when there is no cached data present', () async {
        when(() => mockLocalDataSource.getLastProducts()).thenThrow(CacheException());

        final result = await repository.getProductById(tId);

        expect(result, equals(Left(CacheFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getLastProducts());
      });
    });
  });

  group('createProduct', () {
    final tProduct = ProductModel(
      id: 1,
      name: 'Test Product',
      description: 'Test Description',
      imageUrl: 'test.jpg',
      price: 100.0,
    );

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return success when remote call is successful', () async {
        when(() => mockRemoteDataSource.createProduct(any())).thenAnswer((_) async => {});

        final result = await repository.createProduct(tProduct);

        expect(result, equals(const Right(null)));
        verify(() => mockRemoteDataSource.createProduct(tProduct));
      });

      test('should return server failure when remote call fails', () async {
        when(() => mockRemoteDataSource.createProduct(any())).thenThrow(ServerException());

        final result = await repository.createProduct(tProduct);

        expect(result, equals(Left(ServerFailure())));
        verify(() => mockRemoteDataSource.createProduct(tProduct));
      });
    });

    group('device is offline', () {
      test('should return network failure', () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        final result = await repository.createProduct(tProduct);

        expect(result, equals(Left(NetworkFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });

  group('updateProduct', () {
    final tProduct = ProductModel(
      id: 1,
      name: 'Test Product',
      description: 'Test Description',
      imageUrl: 'test.jpg',
      price: 100.0,
    );

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return success when remote call is successful', () async {
        when(() => mockRemoteDataSource.updateProduct(any())).thenAnswer((_) async => {});

        final result = await repository.updateProduct(tProduct);

        expect(result, equals(const Right(null)));
        verify(() => mockRemoteDataSource.updateProduct(tProduct));
      });

      test('should return server failure when remote call fails', () async {
        when(() => mockRemoteDataSource.updateProduct(any())).thenThrow(ServerException());

        final result = await repository.updateProduct(tProduct);

        expect(result, equals(Left(ServerFailure())));
        verify(() => mockRemoteDataSource.updateProduct(tProduct));
      });
    });

    group('device is offline', () {
      test('should return network failure', () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        final result = await repository.updateProduct(tProduct);

        expect(result, equals(Left(NetworkFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });

  group('deleteProduct', () {
    final tId = 1;

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return success when remote call is successful', () async {
        when(() => mockRemoteDataSource.deleteProduct(any())).thenAnswer((_) async => {});

        final result = await repository.deleteProduct(tId);

        expect(result, equals(const Right(null)));
        verify(() => mockRemoteDataSource.deleteProduct(tId));
      });

      test('should return server failure when remote call fails', () async {
        when(() => mockRemoteDataSource.deleteProduct(any())).thenThrow(ServerException());

        final result = await repository.deleteProduct(tId);

        expect(result, equals(Left(ServerFailure())));
        verify(() => mockRemoteDataSource.deleteProduct(tId));
      });
    });

    group('device is offline', () {
      test('should return network failure', () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        final result = await repository.deleteProduct(tId);

        expect(result, equals(Left(NetworkFailure())));
        verifyZeroInteractions(mockRemoteDataSource);
      });
    });
  });
}
