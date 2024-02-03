import 'Product.dart';

class MyProduct {
  static List<Product> sneakersList = [
    Product(
        id: 1,
        name: "Nike 1",
        price: 180.00,
        image: "assets/images/sneakers/1.jpg",
        category: "Trending Now",
        description: "This is a very good shoe for you!",
        quantity: 1),
    Product(
        id: 2,
        name: "Nike 2",
        price: 180.00,
        image: "assets/images/sneakers/2.jpg",
        category: "Trending Now",
        description: "This is a very good shoe for you!",
        quantity: 1),
    Product(
        id: 3,
        name: "Hoka 1",
        price: 180.00,
        image: "assets/images/sneakers/3.jpg",
        category: "Trending Now",
        description: "This is a very good shoe for you!",
        quantity: 1),
    Product(
        id: 4,
        name: "Keen 3",
        price: 180.00,
        image: "assets/images/sneakers/4.jpg",
        category: "Trending Now",
        description: "This is a very good shoe for you!",
        quantity: 1),
    Product(
        id: 5,
        name: "Puma 6",
        price: 180.00,
        image: "assets/images/sneakers/5.jpg",
        category: "Trending Now",
        description: "This is a very good shoe for you!",
        quantity: 1),
  ];
  static List<Product> jacketsList = [
    Product(
        id: 1,
        name: "Jacket 1",
        price: 180.00,
        image: "assets/images/jackets/1.jpg",
        category: "Trending Now",
        description: "This is a very good jacket for you!",
        quantity: 1),
    Product(
        id: 2,
        name: "Jacket 2",
        price: 180.00,
        image: "assets/images/jackets/2.jpeg",
        category: "Trending Now",
        description: "This is a very good jacket for you!",
        quantity: 1),
    Product(
        id: 3,
        name: "Jacket 3",
        price: 180.00,
        image: "assets/images/jackets/3.jpeg",
        category: "Trending Now",
        description: "This is a very good jacket for you!",
        quantity: 1),
    Product(
        id: 4,
        name: "Jacket 4",
        price: 180.00,
        image: "assets/images/jackets/4.jpg",
        category: "Trending Now",
        description: "This is a very good jacket for you!",
        quantity: 1),
    Product(
        id: 5,
        name: "Jacket 5",
        price: 180.00,
        image: "assets/images/jackets/5.jpeg",
        category: "Trending Now",
        description: "This is a very good jacket for you!",
        quantity: 1),
  ];
  static List<Product> allProducts = sneakersList + jacketsList;
}
