// import '../features/shop/models/brand_category_model.dart';
// import '../features/shop/models/brand_model.dart';
// import '../features/shop/models/product_attribute_model.dart';
// import '../features/shop/models/product_category_model.dart';
// import '../features/shop/models/product_model.dart';
// import '../utils/constants/image_strings.dart';
//
// class SgDummyData {
//   /// List of all Banners
//   //
//   // static final List<BannerModel> banners = [
//   //   BannerModel(
//   //       imageUrl: SgImages.banner1, targetScreen: SgRoutes.order, active: true),
//   //   BannerModel(
//   //       imageUrl: SgImages.banner2, targetScreen: SgRoutes.cart, active: true),
//   //   BannerModel(
//   //       imageUrl: SgImages.banner3,
//   //       targetScreen: SgRoutes.favourites,
//   //       active: true),
//   //   BannerModel(
//   //       imageUrl: SgImages.banner4,
//   //       targetScreen: SgRoutes.search,
//   //       active: true),
//   //   BannerModel(
//   //       imageUrl: SgImages.banner5,
//   //       targetScreen: SgRoutes.settings,
//   //       active: true),
//   //   BannerModel(
//   //       imageUrl: SgImages.banner6,
//   //       targetScreen: SgRoutes.userAddress,
//   //       active: true),
//   //   BannerModel(
//   //       imageUrl: SgImages.banner7,
//   //       targetScreen: SgRoutes.userAddress,
//   //       active: true),
//   //   BannerModel(
//   //       imageUrl: SgImages.banner8,
//   //       targetScreen: SgRoutes.checkout,
//   //       active: true),
//   //   BannerModel(
//   //       imageUrl: SgImages.banner9,
//   //       targetScreen: SgRoutes.checkout,
//   //       active: true),
//   // ];
//   //
//   // /// List of all Categories
//   // static final List<CategoryModel> categories = [
//   //   CategoryModel(
//   //       id: '1', name: 'Shoes', image: SgImages.shoesIcon, isFeatured: true),
//   //   CategoryModel(
//   //       id: '2', name: 'Shirts', image: SgImages.shirtIcon, isFeatured: true),
//   //   CategoryModel(
//   //       id: '3', name: 'Bags', image: SgImages.bagIcon, isFeatured: true),
//   //   CategoryModel(
//   //       id: '4', name: 'Scents', image: SgImages.scentsIcon, isFeatured: true),
//   //   CategoryModel(
//   //       id: '5', name: 'Bottoms', image: SgImages.pantsIcon, isFeatured: true),
//   //   CategoryModel(
//   //       id: '6', name: 'Dresses', image: SgImages.dressIcon, isFeatured: true),
//   //   CategoryModel(
//   //       id: '7',
//   //       name: 'Cosmo',
//   //       image: SgImages.cosmeticsIcon,
//   //       isFeatured: true),
//   //   CategoryModel(
//   //       id: '8',
//   //       name: 'Jewelery',
//   //       image: SgImages.jeweleryIcon,
//   //       isFeatured: true),
//   //   CategoryModel(
//   //       id: '9', name: 'Suits', image: SgImages.suitIcon, isFeatured: true),
//   //   CategoryModel(
//   //       id: '10',
//   //       name: 'Singlets',
//   //       image: SgImages.singletIcon,
//   //       isFeatured: true),
//   //   //
//   //   // /// Sub-Categories
//   //   // CategoryModel(
//   //   //     id: '11',
//   //   //     name: 'Sport Shoes',
//   //   //     image: SgImages.shoesIcon,
//   //   //     parentId: '1',
//   //   //     isFeatured: false),
//   //   // CategoryModel(
//   //   //     id: '91',
//   //   //     name: 'Track suits',
//   //   //     image: SgImages.suitIcon,
//   //   //     parentId: '9',
//   //   //     isFeatured: false),
//   //   // CategoryModel(
//   //   //     id: '12',
//   //   //     name: 'Sneakers',
//   //   //     image: SgImages.shoesIcon,
//   //   //     parentId: '1',
//   //   //     isFeatured: false),
//   //   //
//   //   // /// Dresses
//   //   // CategoryModel(
//   //   //     id: '61',
//   //   //     name: 'Maxi dress',
//   //   //     image: SgImages.dressIcon,
//   //   //     parentId: '6',
//   //   //     isFeatured: false),
//   //   // CategoryModel(
//   //   //     id: '62',
//   //   //     name: 'Ball Dress',
//   //   //     image: SgImages.dressIcon,
//   //   //     parentId: '6',
//   //   //     isFeatured: false),
//   //   // CategoryModel(
//   //   //     id: '63',
//   //   //     name: 'Wedding Dress',
//   //   //     image: SgImages.dressIcon,
//   //   //     parentId: '6',
//   //   //     isFeatured: false),
//   //   //
//   //   // /// Bottoms
//   //   // CategoryModel(
//   //   //     id: '51',
//   //   //     name: 'Pants',
//   //   //     image: SgImages.shirtIcon,
//   //   //     parentId: '5',
//   //   //     isFeatured: false),
//   //   // CategoryModel(
//   //   //     id: '52',
//   //   //     name: 'Shorts',
//   //   //     image: SgImages.shirtIcon,
//   //   //     parentId: '5',
//   //   //     isFeatured: false),
//   //   // CategoryModel(
//   //   //     id: '53',
//   //   //     name: 'Jeans',
//   //   //     image: SgImages.shirtIcon,
//   //   //     parentId: '5',
//   //   //     isFeatured: false),
//   // ];
//
//   /// List of all products - 36 Products
//   static final List<ProductModel> products = [
//     // shoes nike
//     // // 001
//     // ProductModel(
//     //     id: '001',
//     //     title: 'Purple Nike Shoes',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage6,
//     //     description: 'Purple Nike Shoes',
//     //     brand: BrandModel(
//     //         id: '1',
//     //         image: SgImages.nikeLogo,
//     //         name: 'Nike',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [
//     //       SgImages.productImage7,
//     //       SgImages.productImage10,
//     //       SgImages.productImage13
//     //     ],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //       ProductAttributeModel(
//     //           name: 'Color', values: ['Green', 'Blue', 'Black']),
//     //     ],
//     //     productVariations: [
//     //       ProductVariationModel(
//     //           id: '1',
//     //           stock: 34,
//     //           price: 134,
//     //           salePrice: 122.6,
//     //           image: SgImages.productImage7,
//     //           description:
//     //               'This is Product description for Green Nike sports shoe',
//     //           attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
//     //       ProductVariationModel(
//     //           id: '2',
//     //           stock: 15,
//     //           price: 132,
//     //           image: SgImages.productImage7,
//     //           attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
//     //       ProductVariationModel(
//     //           id: '3',
//     //           stock: 0,
//     //           price: 234,
//     //           image: SgImages.productImage10,
//     //           attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
//     //       ProductVariationModel(
//     //           id: '4',
//     //           stock: 222,
//     //           price: 232,
//     //           image: SgImages.productImage10,
//     //           attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
//     //       ProductVariationModel(
//     //           id: '5',
//     //           stock: 0,
//     //           price: 334,
//     //           image: SgImages.productImage13,
//     //           attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
//     //       ProductVariationModel(
//     //           id: '6',
//     //           stock: 11,
//     //           price: 332,
//     //           image: SgImages.productImage13,
//     //           attributeValues: {'Color': 'Black', 'Size': 'EU 32'})
//     //     ],
//     //     productType: 'ProductType.variable'),
//     // //002
//     // ProductModel(
//     //     id: '002',
//     //     title: 'Art N Design Nike Shoe',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage1,
//     //     description: 'Art N Design Nike Shoe',
//     //     brand: BrandModel(
//     //         id: '1',
//     //         image: SgImages.nikeLogo,
//     //         name: 'Nike',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [SgImages.productImage3],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //       ProductAttributeModel(name: 'Color', values: ['White']),
//     //     ],
//     //     productVariations: [
//     //       ProductVariationModel(
//     //           id: '1',
//     //           stock: 34,
//     //           price: 134,
//     //           salePrice: 122.6,
//     //           image: SgImages.productImage3,
//     //           description:
//     //               'This is Product description for Green Nike sports shoe',
//     //           attributeValues: {'Color': 'White', 'Size': 'EU 34'}),
//     //       ProductVariationModel(
//     //           id: '2',
//     //           stock: 15,
//     //           price: 132,
//     //           image: SgImages.productImage3,
//     //           attributeValues: {'Color': 'White', 'Size': 'EU 32'}),
//     //       ProductVariationModel(
//     //           id: '3',
//     //           stock: 0,
//     //           price: 234,
//     //           image: SgImages.productImage3,
//     //           attributeValues: {'Color': 'White', 'Size': 'EU 36'}),
//     //     ],
//     //     productType: 'ProductType.variable'),
//     // // 003
//     // ProductModel(
//     //     id: '003',
//     //     title: 'Blue Nike Shoes',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage2,
//     //     description: 'Blue Nike Shoes',
//     //     brand: BrandModel(
//     //         id: '1',
//     //         image: SgImages.nikeLogo,
//     //         name: 'Nike',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productType: 'ProductType.single'),
//     // // 004
//     // ProductModel(
//     //     id: '004',
//     //     title: 'Cream X Purple Nike Shoes',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage4,
//     //     description: 'Cream X Purple Nike Shoes',
//     //     brand: BrandModel(
//     //         id: '1',
//     //         image: SgImages.nikeLogo,
//     //         name: 'Nike',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productType: 'ProductType.single'),
//     // // 005
//     // ProductModel(
//     //     id: '005',
//     //     title: 'Sky Blue X Lime Nike Shoes',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage5,
//     //     description: 'Sky Blue X Lime Nike Shoes',
//     //     brand: BrandModel(
//     //         id: '1',
//     //         image: SgImages.nikeLogo,
//     //         name: 'Nike',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productType: 'ProductType.single'),
//     // // 006
//     // ProductModel(
//     //     id: '006',
//     //     title: 'Yellow X Black Nike Shoes',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage8,
//     //     description: 'Yellow X Black Nike Shoes',
//     //     brand: BrandModel(
//     //         id: '1',
//     //         image: SgImages.nikeLogo,
//     //         name: 'Nike',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [SgImages.productImage11],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //       ProductAttributeModel(name: 'Color', values: ['Blue']),
//     //     ],
//     //     productVariations: [
//     //       ProductVariationModel(
//     //           id: '1',
//     //           stock: 34,
//     //           price: 134,
//     //           salePrice: 122.6,
//     //           image: SgImages.productImage11,
//     //           description:
//     //               'This is Product description for Blue Nike sports shoe',
//     //           attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
//     //       ProductVariationModel(
//     //           id: '2',
//     //           stock: 15,
//     //           price: 132,
//     //           image: SgImages.productImage11,
//     //           attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
//     //       ProductVariationModel(
//     //           id: '3',
//     //           stock: 0,
//     //           price: 234,
//     //           image: SgImages.productImage11,
//     //           attributeValues: {'Color': 'Green', 'Size': 'EU 36'}),
//     //     ],
//     //     productType: 'ProductType.variable'),
//     // // 007
//     // ProductModel(
//     //     id: '007',
//     //     title: 'Red Nike Shoes',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage9,
//     //     description: 'Red Nike Shoes',
//     //     brand: BrandModel(
//     //         id: '1',
//     //         image: SgImages.nikeLogo,
//     //         name: 'Nike',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [SgImages.productImage14],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //       ProductAttributeModel(name: 'Color', values: ['Blue']),
//     //     ],
//     //     productVariations: [
//     //       ProductVariationModel(
//     //           id: '1',
//     //           stock: 34,
//     //           price: 134,
//     //           salePrice: 122.6,
//     //           image: SgImages.productImage14,
//     //           description:
//     //               'This is Product description for Blue Nike sports shoe',
//     //           attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
//     //       ProductVariationModel(
//     //           id: '2',
//     //           stock: 15,
//     //           price: 132,
//     //           image: SgImages.productImage11,
//     //           attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
//     //       ProductVariationModel(
//     //           id: '3',
//     //           stock: 0,
//     //           price: 234,
//     //           image: SgImages.productImage11,
//     //           attributeValues: {'Color': 'Green', 'Size': 'EU 36'}),
//     //     ],
//     //     productType: 'ProductType.variable'),
//     // // 008
//     // ProductModel(
//     //     id: '008',
//     //     title: 'White Nike Shoes',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage12,
//     //     description: 'White Nike Shoes',
//     //     brand: BrandModel(
//     //         id: '1',
//     //         image: SgImages.nikeLogo,
//     //         name: 'Nike',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productType: 'ProductType.single'),
//     //
//     // // shirts
//     // // 009
//     // ProductModel(
//     //     id: '009',
//     //     title: 'T-shirt ',
//     //     stock: 15,
//     //     price: 35,
//     //     isFeatured: true,
//     //     thumbnail: SgImages.productImage15,
//     //     description: 'This is product description for Zara Half Sleeve Shirt.',
//     //     brand: BrandModel(id: '6', image: SgImages.zaraLogo, name: 'ZARA'),
//     //     images: [SgImages.productImage16, SgImages.productImage17],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '2',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['Large', 'Medium']),
//     //       ProductAttributeModel(name: 'Color', values: ['Black', 'Red']),
//     //     ],
//     //     productVariations: [
//     //       ProductVariationModel(
//     //           id: '1',
//     //           stock: 34,
//     //           price: 134,
//     //           salePrice: 122.6,
//     //           image: SgImages.productImage16,
//     //           description:
//     //               'This is product description for Zara Half Sleeve Shirt.',
//     //           attributeValues: {'Color': 'Black', 'Size': 'Large'}),
//     //       ProductVariationModel(
//     //           id: '2',
//     //           stock: 15,
//     //           price: 132,
//     //           image: SgImages.productImage17,
//     //           attributeValues: {'Color': 'Red', 'Size': 'Large'}),
//     //       ProductVariationModel(
//     //           id: '3',
//     //           stock: 0,
//     //           price: 234,
//     //           image: SgImages.productImage16,
//     //           attributeValues: {'Color': 'Black', 'Size': 'Medium'}),
//     //       ProductVariationModel(
//     //           id: '4',
//     //           stock: 0,
//     //           price: 234,
//     //           image: SgImages.productImage17,
//     //           attributeValues: {'Color': 'Red', 'Size': 'Medium'}),
//     //     ],
//     //     productType: 'ProductType.variable'),
//     // // 010
//     // ProductModel(
//     //     id: '010',
//     //     title: 'T-shirt ',
//     //     stock: 15,
//     //     price: 35,
//     //     isFeatured: true,
//     //     thumbnail: SgImages.productImage18,
//     //     description:
//     //         'This is product description for Zara Full Sleeve Yellow Shirt.',
//     //     brand: BrandModel(id: '6', image: SgImages.zaraLogo, name: 'ZARA'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '2',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['Large', 'Medium']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // //011
//     // ProductModel(
//     //     id: '011',
//     //     title: 'Denim Jacket',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage31,
//     //     description:
//     //         'This is product description for Denim Jacket. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '2', image: SgImages.adidasLogo, name: 'Adidas'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '2',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['Large', 'Medium']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 012
//     // ProductModel(
//     //     id: '012',
//     //     title: 'Blue louis Vuitton Designer Bag',
//     //     stock: 15,
//     //     price: 135,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage78,
//     //     description:
//     //         'This is product description for louis Vuitton Designer Bag. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(
//     //         id: '13', image: SgImages.louisVuittonLogo, name: 'louis Vuitton'),
//     //     images: [
//     //       SgImages.productImage79,
//     //       SgImages.productImage83,
//     //       SgImages.productImage84,
//     //     ],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '3',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Color', values: ['Red', 'Pink', 'Purple'])
//     //     ],
//     //     productVariations: [
//     //       ProductVariationModel(
//     //           id: '1',
//     //           stock: 15,
//     //           price: 132,
//     //           image: SgImages.productImage79,
//     //           attributeValues: {'Color': 'Red'}),
//     //       ProductVariationModel(
//     //           id: '2',
//     //           stock: 0,
//     //           price: 234,
//     //           image: SgImages.productImage83,
//     //           attributeValues: {'Color': 'Pink'}),
//     //       ProductVariationModel(
//     //           id: '4',
//     //           stock: 222,
//     //           price: 232,
//     //           image: SgImages.productImage84,
//     //           attributeValues: {'Color': 'Purple'}),
//     //     ],
//     //     productType: 'ProductType.variable'),
//     // // 013
//     // ProductModel(
//     //     id: '013',
//     //     title: 'Black X White T Shirt',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage19,
//     //     description:
//     //         'This is product description for Black X White T Shirt. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '3', image: SgImages.jordanLogo, name: 'Jordan'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '2',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['Large', 'Medium']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 014
//     // ProductModel(
//     //     id: '014',
//     //     title: 'Pink lady\'s Shirt',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage21,
//     //     description:
//     //         'This is product description for Pink lady\'s Shirt. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '5', image: SgImages.pumaLogo, name: 'Puma'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '2',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['Large', 'Medium']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 015
//     // ProductModel(
//     //     id: '015',
//     //     title: 'Sweet Shirt',
//     //     stock: 15,
//     //     price: 750,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage20,
//     //     description: "Sweet Shirt",
//     //     brand: BrandModel(id: '11', image: SgImages.gucciLogo, name: 'Gucci'),
//     //     images: [
//     //       SgImages.productImage21,
//     //     ],
//     //     salePrice: 650,
//     //     sku: 'ABR4568',
//     //     categoryId: '2',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['Large', 'Medium', 'Small']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 016
//     // ProductModel(
//     //   id: '016',
//     //   title: 'Black Sandal',
//     //   stock: 10,
//     //   price: 50000,
//     //   isFeatured: true,
//     //   thumbnail: SgImages.productImage35,
//     //   description: "Beautiful Black Sandal",
//     //   brand: BrandModel(id: '10', image: SgImages.acerLogo, name: 'Acer'),
//     //   images: [
//     //     SgImages.productImage37,
//     //     SgImages.productImage43,
//     //   ],
//     //   salePrice: 0,
//     //   sku: 'sandal12WEWD',
//     //   categoryId: '10',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
//     //     ProductAttributeModel(name: 'Color', values: ['Red', 'Cream'])
//     //   ],
//     //   productType: 'ProductType.variable',
//     //   productVariations: [
//     //     ProductVariationModel(
//     //         id: '1',
//     //         stock: 34,
//     //         price: 134,
//     //         salePrice: 122.6,
//     //         image: SgImages.productImage37,
//     //         description: 'This is product description for Red Sandal',
//     //         attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
//     //     ProductVariationModel(
//     //         id: '2',
//     //         stock: 15,
//     //         price: 132,
//     //         image: SgImages.productImage37,
//     //         attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
//     //     ProductVariationModel(
//     //         id: '3',
//     //         stock: 0,
//     //         price: 234,
//     //         image: SgImages.productImage43,
//     //         attributeValues: {'Color': 'Cream', 'Size': 'EU 34'}),
//     //     ProductVariationModel(
//     //         id: '4',
//     //         stock: 222,
//     //         price: 232,
//     //         image: SgImages.productImage43,
//     //         attributeValues: {'Color': 'Cream', 'Size': 'EU 32'}),
//     //   ],
//     // ),
//     // // 017
//     // ProductModel(
//     //   id: '017',
//     //   title: 'LV Handbag',
//     //   stock: 10,
//     //   price: 1200.00,
//     //   thumbnail: SgImages.productImage81,
//     //   description: 'Elegant LV handbag perfect for any occasion.',
//     //   brand: BrandModel(
//     //     id: '13',
//     //     image: SgImages.louisVuittonLogo,
//     //     name: 'Louis Vouitton',
//     //   ),
//     //   images: [
//     //     SgImages.productImage82,
//     //   ],
//     //   salePrice: 1150.00,
//     //   sku: 'GU006',
//     //   categoryId: '3',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Color', values: ['White']),
//     //   ],
//     //   productVariations: [
//     //     ProductVariationModel(
//     //         id: '1',
//     //         stock: 34,
//     //         price: 134,
//     //         salePrice: 122.6,
//     //         image: SgImages.productImage82,
//     //         description: 'This is product description for White LV Bag',
//     //         attributeValues: {'Color': 'White'}),
//     //   ],
//     //   productType: 'ProductType.variable',
//     // ),
//     // // 018
//     // ProductModel(
//     //   id: '018',
//     //   title: 'Chanel Jeans',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage61,
//     //   description: 'Comfortable and stylish Channel jeans.',
//     //   brand: BrandModel(
//     //     id: '12',
//     //     image: SgImages.channelLogo,
//     //     name: 'Channel',
//     //   ),
//     //   images: [
//     //     SgImages.productImage61,
//     //   ],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '5',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 019
//     // ProductModel(
//     //   id: '019',
//     //   title: 'Shirts',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage22,
//     //   description: 'Comfortable and stylish Shirts.',
//     //   brand: BrandModel(
//     //     id: '12',
//     //     image: SgImages.channelLogo,
//     //     name: 'Chanel',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 020
//     // ProductModel(
//     //   id: '020',
//     //   title: 'Shirts',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage23,
//     //   description: 'Comfortable and stylish Shirts.',
//     //   brand: BrandModel(
//     //     id: '12',
//     //     image: SgImages.channelLogo,
//     //     name: 'Chanel',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 021
//     // ProductModel(
//     //     id: '021',
//     //     title: 'Multi Color Adidas Shoe',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage24,
//     //     description: 'Multi Color Adidas Shoe',
//     //     brand: BrandModel(
//     //         id: '2',
//     //         image: SgImages.adidasLogo,
//     //         name: 'Adidas',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 022
//     // ProductModel(
//     //     id: '022',
//     //     title: 'White X Purple Adidas Shoe',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage25,
//     //     description: 'White X Purple Adidas Shoe',
//     //     brand: BrandModel(
//     //         id: '2',
//     //         image: SgImages.adidasLogo,
//     //         name: 'Adidas',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 023
//     // ProductModel(
//     //     id: '023',
//     //     title: 'White X Blue Shoe',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage26,
//     //     description: 'White X Blue Shoe',
//     //     brand: BrandModel(
//     //         id: '4',
//     //         image: SgImages.jordanLogo,
//     //         name: 'Jordan',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 024
//     // ProductModel(
//     //     id: '024',
//     //     title: 'Grey X Pink Shoe',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage27,
//     //     description: 'Grey X Pink Shoe',
//     //     brand: BrandModel(
//     //         id: '4',
//     //         image: SgImages.jordanLogo,
//     //         name: 'Jordan',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 025
//     // ProductModel(
//     //     id: '025',
//     //     title: 'Grey X Blue Shoe',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage28,
//     //     description: 'Grey X Blue Shoe',
//     //     brand: BrandModel(
//     //         id: '4',
//     //         image: SgImages.jordanLogo,
//     //         name: 'Jordan',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 026
//     // ProductModel(
//     //     id: '026',
//     //     title: 'Red Shoe',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage29,
//     //     description: 'Red Shoe',
//     //     brand: BrandModel(
//     //         id: '4',
//     //         image: SgImages.jordanLogo,
//     //         name: 'Jordan',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 027
//     // ProductModel(
//     //     id: '027',
//     //     title: 'Green Shoe',
//     //     stock: 15,
//     //     price: 135,
//     //     thumbnail: SgImages.productImage30,
//     //     description: 'Green Shoe',
//     //     brand: BrandModel(
//     //         id: '4',
//     //         image: SgImages.jordanLogo,
//     //         name: 'Jordan',
//     //         productsCount: 265,
//     //         isFeatured: true),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '1',
//     //     productAttributes: [
//     //       ProductAttributeModel(
//     //           name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 028
//     // ProductModel(
//     //     id: '028',
//     //     title: 'Denim Jacket',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage32,
//     //     description:
//     //         'This is product description for Denim Jacket. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '5', image: SgImages.pumaLogo, name: 'Puma'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '2',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['Large', 'Medium']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 029
//     // ProductModel(
//     //     id: '029',
//     //     title: 'Denim Jacket',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage33,
//     //     description:
//     //         'This is product description for Denim Jacket. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand:
//     //         BrandModel(id: '7', image: SgImages.kenwoodLogo, name: 'Kenwood'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '2',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['Large', 'Medium']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 030
//     // ProductModel(
//     //     id: '030',
//     //     title: 'Cream X Black Sandal',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage34,
//     //     description:
//     //         'This is product description for Cream X Black Sandal. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '2', image: SgImages.adidasLogo, name: 'Adidas'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '10',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['32', '34', '36']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 031
//     // ProductModel(
//     //     id: '031',
//     //     title: ' Black Sandal',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage36,
//     //     description:
//     //         'This is product description for  Black Sandal. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(
//     //         id: '8', image: SgImages.hermanMillerLogo, name: 'Herman Miller'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '10',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['32', '34', '36']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 032
//     // ProductModel(
//     //     id: '032',
//     //     title: ' Cream Sandal',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage38,
//     //     description:
//     //         'This is product description for  Cream Sandal. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '9', image: SgImages.ikeaLogo, name: 'Ikea'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '10',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['32', '34', '36']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 033
//     // ProductModel(
//     //     id: '033',
//     //     title: ' Pink Sandal',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage39,
//     //     description:
//     //         'This is product description for Pink Sandal. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '10', image: SgImages.acerLogo, name: 'Acer'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '10',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['32', '34', '36']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 034
//     // ProductModel(
//     //     id: '034',
//     //     title: ' Cream Sandal',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage40,
//     //     description:
//     //         'This is product description for Cream Sandal. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '10', image: SgImages.acerLogo, name: 'Acer'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '10',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['32', '34', '36']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 035
//     // ProductModel(
//     //     id: '035',
//     //     title: ' Brown X Cream Sandal',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage41,
//     //     description:
//     //         'This is product description for Brown X Cream Sandal. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '11', image: SgImages.gucciLogo, name: 'Gucci'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '10',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['32', '34', '36']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // //036
//     // ProductModel(
//     //     id: '036',
//     //     title: ' Black X Cream Sandal',
//     //     stock: 15,
//     //     price: 38000,
//     //     isFeatured: false,
//     //     thumbnail: SgImages.productImage42,
//     //     description:
//     //         'This is product description for Black X Cream Sandal. There are more things that can be added but I am just practicing and nothing else.',
//     //     brand: BrandModel(id: '11', image: SgImages.gucciLogo, name: 'Gucci'),
//     //     images: [],
//     //     salePrice: 30,
//     //     sku: 'ABR4568',
//     //     categoryId: '10',
//     //     productAttributes: [
//     //       ProductAttributeModel(name: 'Size', values: ['32', '34', '36']),
//     //     ],
//     //     productType: 'ProductType.single'),
//     // // 037
//     // ProductModel(
//     //   id: '037',
//     //   title: 'Tops',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage70,
//     //   description: 'Comfortable and stylish Top.',
//     //   brand: BrandModel(
//     //     id: '12',
//     //     image: SgImages.channelLogo,
//     //     name: 'Chanel',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 038
//     // ProductModel(
//     //   id: '038',
//     //   title: 'Women Top ',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage71,
//     //   description: 'Comfortable and stylish Women Top.',
//     //   brand: BrandModel(
//     //     id: '13',
//     //     image: SgImages.louisVuittonLogo,
//     //     name: 'louis Vuitton',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 039
//     // ProductModel(
//     //   id: '039',
//     //   title: 'Beautiful Top Shirt',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage72,
//     //   description: 'Comfortable and stylish woman top.',
//     //   brand: BrandModel(
//     //     id: '4',
//     //     image: SgImages.jordanLogo,
//     //     name: 'Jordan',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 040
//     // ProductModel(
//     //   id: '040',
//     //   title: 'Elegant woman top',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage73,
//     //   description: 'Comfortable, stylish and Elegant woman top.',
//     //   brand: BrandModel(
//     //     id: '12',
//     //     image: SgImages.channelLogo,
//     //     name: 'Chanel',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 041
//     // ProductModel(
//     //   id: '041',
//     //   title: 'Stylish Top',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage74,
//     //   description: 'Comfortable and stylish Top.',
//     //   brand: BrandModel(
//     //     id: '1',
//     //     image: SgImages.nikeLogo,
//     //     name: 'Nike',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 042
//     // ProductModel(
//     //   id: '042',
//     //   title: 'Coat',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage64,
//     //   description: 'Comfortable and stylish Coat.',
//     //   brand: BrandModel(
//     //     id: '11',
//     //     image: SgImages.gucciLogo,
//     //     name: 'Gucci',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 043
//     // ProductModel(
//     //   id: '043',
//     //   title: 'Coat',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage65,
//     //   description: 'Comfortable and stylish Coat.',
//     //   brand: BrandModel(
//     //     id: '2',
//     //     image: SgImages.adidasLogo,
//     //     name: 'Adidas',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 044
//     // ProductModel(
//     //   id: '044',
//     //   title: 'Hoddie',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage67,
//     //   description: 'Comfortable and stylish Hoddie.',
//     //   brand: BrandModel(
//     //     id: '11',
//     //     image: SgImages.gucciLogo,
//     //     name: 'Gucci',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 045
//     // ProductModel(
//     //   id: '045',
//     //   title: 'Hoddie',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage66,
//     //   description: 'Comfortable and stylish Hoddie.',
//     //   brand: BrandModel(
//     //     id: '9',
//     //     image: SgImages.acerLogo,
//     //     name: 'Acer',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '2',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 046
//     // ProductModel(
//     //   id: '046',
//     //   title: 'Dress',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage55,
//     //   description: 'Comfortable and stylish Dress.',
//     //   brand: BrandModel(
//     //     id: '6',
//     //     image: SgImages.zaraLogo,
//     //     name: 'Zara',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '6',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 047
//     // ProductModel(
//     //   id: '047',
//     //   title: 'Dress',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage56,
//     //   description: 'Comfortable and stylish Dress.',
//     //   brand: BrandModel(
//     //     id: '2',
//     //     image: SgImages.adidasLogo,
//     //     name: 'Adidas',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '6',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 048
//     // ProductModel(
//     //   id: '048',
//     //   title: 'Dress',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage57,
//     //   description: 'Comfortable and stylish Dress.',
//     //   brand: BrandModel(
//     //     id: '4',
//     //     image: SgImages.jordanLogo,
//     //     name: 'Jordan',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '6',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 049
//     // ProductModel(
//     //   id: '049',
//     //   title: 'Dress',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage58,
//     //   description: 'Comfortable and stylish Dress.',
//     //   brand: BrandModel(
//     //     id: '5',
//     //     image: SgImages.pumaLogo,
//     //     name: 'Puma',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '6',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 050
//     // ProductModel(
//     //   id: '050',
//     //   title: 'Dress',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage59,
//     //   description: 'Comfortable and stylish Dress.',
//     //   brand: BrandModel(
//     //     id: '7',
//     //     image: SgImages.kenwoodLogo,
//     //     name: 'Kenwood',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '6',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 051
//     // ProductModel(
//     //   id: '051',
//     //   title: 'Dress',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage60,
//     //   description: 'Comfortable and stylish Dress.',
//     //   brand: BrandModel(
//     //     id: '7',
//     //     image: SgImages.kenwoodLogo,
//     //     name: 'Kenwood',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '6',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 052
//     // ProductModel(
//     //   id: '052',
//     //   title: 'Dress',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage61,
//     //   description: 'Comfortable and stylish Dress.',
//     //   brand: BrandModel(
//     //     id: '8',
//     //     image: SgImages.hermanMillerLogo,
//     //     name: 'Herman Miller',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '6',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 053
//     // ProductModel(
//     //   id: '053',
//     //   title: 'Dress',
//     //   stock: 25,
//     //   price: 75.00,
//     //   thumbnail: SgImages.productImage62,
//     //   description: 'Comfortable and stylish Dress.',
//     //   brand: BrandModel(
//     //     id: '9',
//     //     image: SgImages.ikeaLogo,
//     //     name: 'Ikea',
//     //   ),
//     //   images: [],
//     //   salePrice: 70.00,
//     //   sku: 'LE007',
//     //   categoryId: '6',
//     //   productAttributes: [
//     //     ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//     //     ProductAttributeModel(
//     //         name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//     //   ],
//     //   productType: 'ProductType.single',
//     // ),
//     // // 054
//     ProductModel(
//       id: '054',
//       title: 'Dress',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage63,
//       description: 'Comfortable and stylish Dress.',
//       brand: BrandModel(
//         id: '10',
//         image: SgImages.acerLogo,
//         name: 'Acer',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '6',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 055
//     ProductModel(
//       id: '055',
//       title: 'Gucci Bloom Perfume',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage86,
//       description: 'Floral Scent.',
//       brand: BrandModel(
//         id: '11',
//         image: SgImages.gucciLogo,
//         name: 'Gucci',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '4',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: [
//           'large',
//           'medium',
//           'small',
//         ]),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 056
//     ProductModel(
//       id: '056',
//       title: 'Perfume',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage87,
//       description: 'Floral Scent.',
//       brand: BrandModel(
//         id: '12',
//         image: SgImages.channelLogo,
//         name: 'Chanel',
//       ),
//       images: [
//         SgImages.productImage87,
//       ],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '4',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: [
//           'large',
//           'medium',
//           'small',
//         ]),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 057
//     ProductModel(
//       id: '057',
//       title: 'Perfume',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage88,
//       description: 'Floral Scent.',
//       brand: BrandModel(
//         id: '12',
//         image: SgImages.channelLogo,
//         name: 'Chanel',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '4',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: [
//           'large',
//           'medium',
//           'small',
//         ]),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 058
//     ProductModel(
//       id: '058',
//       title: ' Perfume',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage85,
//       description: 'Floral Scent.',
//       brand: BrandModel(
//         id: '12',
//         image: SgImages.channelLogo,
//         name: 'Chanel',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '4',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: [
//           'large',
//           'medium',
//           'small',
//         ]),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 059
//     ProductModel(
//       id: '059',
//       title: 'Bottom',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage45,
//       description: 'Comfortable and stylish Bottom.',
//       brand: BrandModel(
//         id: '4',
//         image: SgImages.jordanLogo,
//         name: 'Jordan',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '5',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 060
//     ProductModel(
//       id: '060',
//       title: 'Bottom',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage46,
//       description: 'Comfortable and stylish Bottom.',
//       brand: BrandModel(
//         id: '5',
//         image: SgImages.pumaLogo,
//         name: 'Puma',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '5',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 061
//     ProductModel(
//       id: '061',
//       title: 'Bottom',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage47,
//       description: 'Comfortable and stylish Bottom.',
//       brand: BrandModel(
//         id: '7',
//         image: SgImages.kenwoodLogo,
//         name: 'Kenwood',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '5',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 062
//     ProductModel(
//       id: '062',
//       title: 'Bottom',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage48,
//       description: 'Comfortable and stylish Bottom.',
//       brand: BrandModel(
//         id: '7',
//         image: SgImages.kenwoodLogo,
//         name: 'Kenwood',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '5',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 63
//     ProductModel(
//       id: '063',
//       title: 'Bottom',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage49,
//       description: 'Comfortable and stylish Bottom.',
//       brand: BrandModel(
//         id: '8',
//         image: SgImages.hermanMillerLogo,
//         name: 'Hermzn Miller',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '5',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 64
//     ProductModel(
//       id: '064',
//       title: 'Bottom',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage50,
//       description: 'Comfortable and stylish Bottom.',
//       brand: BrandModel(
//         id: '9',
//         image: SgImages.ikeaLogo,
//         name: 'Ikea',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '5',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 65
//     ProductModel(
//       id: '065',
//       title: 'Bottom',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage51,
//       description: 'Comfortable and stylish Bottom.',
//       brand: BrandModel(
//         id: '10',
//         image: SgImages.acerLogo,
//         name: 'Acer',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '5',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     // 66
//     ProductModel(
//       id: '066',
//       title: 'Suit',
//       stock: 25,
//       price: 75.00,
//       thumbnail: SgImages.productImage89,
//       description: 'Comfortable and stylish Suit.',
//       brand: BrandModel(
//         id: '10',
//         image: SgImages.acerLogo,
//         name: 'Acer',
//       ),
//       images: [],
//       salePrice: 70.00,
//       sku: 'LE007',
//       categoryId: '9',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['30', '32', '34', '36']),
//         ProductAttributeModel(
//             name: 'Fit', values: ['Slim', 'Regular', 'Loose']),
//       ],
//       productType: 'ProductType.single',
//     ),
//   ];
//
//   /// List of all Brands
//   static final List<BrandModel> brands = [
//     BrandModel(
//         id: '1',
//         image: SgImages.nikeLogo,
//         name: 'Nike',
//         productsCount: 6,
//         isFeatured: true),
//     BrandModel(
//         id: '2',
//         image: SgImages.adidasLogo,
//         name: 'Adidas',
//         productsCount: 7,
//         isFeatured: true),
//     BrandModel(
//         id: '3',
//         image: SgImages.appleLogo,
//         name: 'Apple',
//         productsCount: 6,
//         isFeatured: true),
//     BrandModel(
//         id: '4',
//         image: SgImages.jordanLogo,
//         name: 'Jordan',
//         productsCount: 1,
//         isFeatured: true),
//     BrandModel(
//         id: '5',
//         image: SgImages.pumaLogo,
//         name: 'Puma',
//         productsCount: 4,
//         isFeatured: false),
//     BrandModel(
//         id: '6',
//         image: SgImages.zaraLogo,
//         name: 'Zara',
//         productsCount: 3,
//         isFeatured: true),
//     BrandModel(
//         id: '7',
//         image: SgImages.kenwoodLogo,
//         name: 'Kenwood',
//         productsCount: 3,
//         isFeatured: true),
//     BrandModel(
//         id: '8',
//         image: SgImages.hermanMillerLogo,
//         name: 'Herman Miller',
//         productsCount: 5,
//         isFeatured: false),
//     BrandModel(
//         id: '9',
//         image: SgImages.ikeaLogo,
//         name: 'Ikea',
//         productsCount: 7,
//         isFeatured: false),
//     BrandModel(
//         id: '10',
//         image: SgImages.acerLogo,
//         name: 'Acer',
//         productsCount: 2,
//         isFeatured: true),
//     BrandModel(
//         id: '11',
//         image: SgImages.gucciLogo,
//         name: 'Gucci',
//         productsCount: 2,
//         isFeatured: true),
//     BrandModel(
//         id: '12',
//         image: SgImages.channelLogo,
//         name: 'Chanel',
//         productsCount: 2,
//         isFeatured: true),
//     BrandModel(
//         id: '13',
//         image: SgImages.louisVuittonLogo,
//         name: 'Louis Vuitton',
//         productsCount: 2,
//         isFeatured: true),
//   ];
//
//   static final List<BrandCategoryModel> brandCategory = [
//     BrandCategoryModel(categoryId: '1', brandId: '1'), // Shoes
//     BrandCategoryModel(categoryId: '1', brandId: '2'), // Shoes
//
//     BrandCategoryModel(categoryId: '2', brandId: '6'), //shirts
//     BrandCategoryModel(categoryId: '2', brandId: '11'), //shirts
//     BrandCategoryModel(categoryId: '2', brandId: '12'), //shirts
//
//     BrandCategoryModel(categoryId: '3', brandId: '13'), // bags
//     BrandCategoryModel(categoryId: '3', brandId: '5'),
//     BrandCategoryModel(categoryId: '3', brandId: '6'),
//
//     BrandCategoryModel(categoryId: '4', brandId: '11'), // scents
//     BrandCategoryModel(categoryId: '12', brandId: '9'), //
//
//     BrandCategoryModel(categoryId: '5', brandId: '8'), //bottoms - Herman Miller
//     BrandCategoryModel(categoryId: '5', brandId: '9'),
//
//     BrandCategoryModel(
//         categoryId: '5', brandId: '11'), //bottoms - Herman Miller
//     BrandCategoryModel(categoryId: '5', brandId: '4'),
//
//     BrandCategoryModel(categoryId: '6', brandId: '11'), //
//     BrandCategoryModel(categoryId: '6', brandId: '6'),
//     BrandCategoryModel(categoryId: '6', brandId: '12'),
//     BrandCategoryModel(categoryId: '6', brandId: '5'),
//
//     BrandCategoryModel(categoryId: '9', brandId: '10'),
//
//     BrandCategoryModel(categoryId: '10', brandId: '11'), //
//     BrandCategoryModel(categoryId: '10', brandId: '6'),
//     BrandCategoryModel(categoryId: '10', brandId: '12'),
//     BrandCategoryModel(categoryId: '610', brandId: '1'),
//     BrandCategoryModel(categoryId: '6', brandId: '11'), //
//     BrandCategoryModel(categoryId: '6', brandId: '2'),
//   ];
//
//   static final List<ProductCategoryModel> productCategory = [
//     // Sports Category
//     ProductCategoryModel(categoryId: '1', productId: '001'),
//     ProductCategoryModel(categoryId: '1', productId: '002'),
//     ProductCategoryModel(categoryId: '1', productId: '003'),
//     ProductCategoryModel(categoryId: '1', productId: '004'),
//     ProductCategoryModel(categoryId: '1', productId: '005'),
//     ProductCategoryModel(categoryId: '1', productId: '006'),
//     ProductCategoryModel(categoryId: '1', productId: '007'),
//     ProductCategoryModel(categoryId: '1', productId: '008'),
//     ProductCategoryModel(categoryId: '1', productId: '021'),
//     ProductCategoryModel(categoryId: '1', productId: '022'),
//     ProductCategoryModel(categoryId: '1', productId: '023'),
//     ProductCategoryModel(categoryId: '1', productId: '024'),
//     ProductCategoryModel(categoryId: '1', productId: '025'),
//     ProductCategoryModel(categoryId: '1', productId: '026'),
//     ProductCategoryModel(categoryId: '1', productId: '027'),
//
//     // shirts Category
//     ProductCategoryModel(categoryId: '2', productId: '009'),
//     ProductCategoryModel(categoryId: '2', productId: '010'),
//     ProductCategoryModel(categoryId: '2', productId: '011'),
//     ProductCategoryModel(categoryId: '2', productId: '013'),
//     ProductCategoryModel(categoryId: '2', productId: '014'),
//     ProductCategoryModel(categoryId: '2', productId: '015'),
//     ProductCategoryModel(categoryId: '2', productId: '019'),
//     ProductCategoryModel(categoryId: '2', productId: '020'),
//     ProductCategoryModel(categoryId: '2', productId: '028'),
//     ProductCategoryModel(categoryId: '2', productId: '029'),
//     ProductCategoryModel(categoryId: '2', productId: '037'),
//     ProductCategoryModel(categoryId: '2', productId: '038'),
//     ProductCategoryModel(categoryId: '2', productId: '039'),
//     ProductCategoryModel(categoryId: '2', productId: '040'),
//     ProductCategoryModel(categoryId: '2', productId: '041'),
//     ProductCategoryModel(categoryId: '2', productId: '042'),
//     ProductCategoryModel(categoryId: '2', productId: '043'),
//     ProductCategoryModel(categoryId: '2', productId: '044'),
//     ProductCategoryModel(categoryId: '2', productId: '045'),
//
//     // Bags Category
//     ProductCategoryModel(categoryId: '3', productId: '012'),
//     ProductCategoryModel(categoryId: '3', productId: '017'),
//
//     // Scent Category
//     ProductCategoryModel(categoryId: '4', productId: '055'),
//     ProductCategoryModel(categoryId: '4', productId: '056'),
//     ProductCategoryModel(categoryId: '4', productId: '057'),
//     ProductCategoryModel(categoryId: '4', productId: '058'),
//
//     // bottom Category
//     ProductCategoryModel(categoryId: '5', productId: '018'),
//     ProductCategoryModel(categoryId: '5', productId: '059'),
//     ProductCategoryModel(categoryId: '5', productId: '060'),
//     ProductCategoryModel(categoryId: '5', productId: '061'),
//     ProductCategoryModel(categoryId: '5', productId: '062'),
//     ProductCategoryModel(categoryId: '5', productId: '063'),
//     ProductCategoryModel(categoryId: '5', productId: '064'),
//     ProductCategoryModel(categoryId: '5', productId: '065'),
//
//     // dress Category
//     ProductCategoryModel(categoryId: '6', productId: '046'),
//     ProductCategoryModel(categoryId: '6', productId: '047'),
//     ProductCategoryModel(categoryId: '6', productId: '048'),
//     ProductCategoryModel(categoryId: '6', productId: '049'),
//     ProductCategoryModel(categoryId: '6', productId: '050'),
//     ProductCategoryModel(categoryId: '6', productId: '051'),
//     ProductCategoryModel(categoryId: '6', productId: '052'),
//     ProductCategoryModel(categoryId: '6', productId: '053'),
//     ProductCategoryModel(categoryId: '6', productId: '054'),
//     // Cosmetics Category
//
//     // jewelery Category
//
//     // // Sport Shoes Category
//     // ProductCategoryModel(categoryId: '8', productId: '005'),
//
//     // Suit
//     ProductCategoryModel(categoryId: '9', productId: '089'),
//     // Sandals
//     ProductCategoryModel(categoryId: '10', productId: '016'),
//     ProductCategoryModel(categoryId: '10', productId: '030'),
//     ProductCategoryModel(categoryId: '10', productId: '031'),
//     ProductCategoryModel(categoryId: '10', productId: '032'),
//     ProductCategoryModel(categoryId: '10', productId: '033'),
//     ProductCategoryModel(categoryId: '10', productId: '034'),
//     ProductCategoryModel(categoryId: '10', productId: '035'),
//     ProductCategoryModel(categoryId: '10', productId: '036'),
//   ];
// }
