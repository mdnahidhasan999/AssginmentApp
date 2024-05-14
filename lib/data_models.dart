// data_models.dart

class Album {
  final String name;

  Album(this.name);
}

class Photo {
  final String title;
  final String description;
  final String imageUrl;

  Photo(this.title, this.description, this.imageUrl);
}

// Dummy data for albums and photos
List<Album> albums = [
  Album('Mode'),
  Album('Aesthetic'),
  Album('Animals'),
  Album('City'),
  Album('Travel'),
  Album('Sky'),
  Album('Road'),
  Album('Flowers'),
];

List<Photo> photos = [
  Photo('Fashion Model', 'A stylish fashion model', 'assets/mood.jpg'),
  Photo('Sunset', 'Beautiful sunset over the horizon', 'assets/asthetic.jpg'),
  Photo('Cute Cat', 'Adorable fluffy cat', 'assets/tshirt.jpg'),
  Photo('City Skyline', 'Urban city skyline view', 'assets/city.jpg'),
  Photo('Mountain View', 'Scenic mountain landscape', 'assets/Sweatshirt.jpg'),
  Photo('Clouds', 'Fluffy clouds in the sky', 'assets/sky.jpg'),
  Photo('Open Road', 'Endless road journey', 'assets/road.jpg'),
  Photo('Spring Blossoms', 'Colorful spring flowers', 'assets/flowers.jpg'),
];
