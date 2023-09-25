import 'package:flutter/material.dart';
import 'package:my_secondapp/savings/app.dart';

class MySecond extends StatefulWidget {
  const MySecond({Key? key}) : super(key: key);

  @override
  State<MySecond> createState() => _MySecondState();
}

class _MySecondState extends State<MySecond> {
  static List<Movies> movies_list = [
    Movies(
      "Leo",
      2023,
      "https://wallpapercave.com/wp/wp12220929.jpg",
      9.3,
    ),
    Movies(
        "Salaar",
        2023,
        "https://i.pinimg.com/originals/f0/64/3f/f0643f638f85f73f878245ad84fd63bc.jpg",
        9.2),
    Movies(
        "Jailer",
        2023,
        "https://upload.wikimedia.org/wikipedia/en/3/3f/Jailer_film_poster.jpg",
        9.1),
    Movies(
        "King Of Kotha",
        2023,
        "https://m.media-amazon.com/images/M/MV5BYzI3ZGEzM2EtNmU3ZC00YTE2LTg4ZDctMjcxNjliOTBlYjkyXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_FMjpg_UX1000_.jpg",
        9.3),
    Movies(
        "Jawan",
        2023,
        "https://i.pinimg.com/736x/66/50/8a/66508a1184926e54cf6d781f0a307f3d.jpg",
        8.9),
    Movies(
        "Vikram",
        2022,
        "https://m.media-amazon.com/images/M/MV5BMmJhYTYxMGEtNjQ5NS00MWZiLWEwN2ItYjJmMWE2YTU1YWYxXkEyXkFqcGdeQXVyMTEzNzg0Mjkx._V1_.jpg",
        9.2),
    Movies(
        "Kgf 2",
        2022,
        "https://e1.pxfuel.com/desktop-wallpaper/794/865/desktop-wallpaper-kgf-chapter-2-stills-first-look-posters-of-kgf-chapter-2-movie-kgf-chapter-2-poster.jpg",
        9.8),
    Movies(
        "Kaithi",
        2019,
        "https://onlookersmedia.in/wp-content/uploads/2019/05/Second-look-of-Karthi-starrer-Kaithi-2.jpg",
        9.2),
    Movies(
        "Romanjum",
        2023,
        "https://upload.wikimedia.org/wikipedia/en/0/07/Romancham-poster.jpg",
        9.3),
    Movies(
        "Kaduva",
        2022,
        "https://e1.pxfuel.com/desktop-wallpaper/625/91/desktop-wallpaper-kaduva-malayalam-movie-in-2021-kurup-movie-thumbnail.jpg",
        9.2),
    Movies("Cid Moosa", 2003,
        "https://upload.wikimedia.org/wikipedia/en/a/a2/C.I.D._Moosa.jpg", 9.2),
    Movies("Cobra", 2022,
        "https://teqip.in/wp-content/uploads/2022/10/Cobra.jpg", 8.1),
    Movies("Rorschach", 2022, "https://i.redd.it/6d58n59j8no91.jpg", 9.2),
    Movies(
        "Kanguva",
        2024,
        "https://www.91-cdn.com/metareel-images/content/posters-7-1687397060664-e6k0JSkzdcnv8XO36kfssGDRsfj.jpg",
        9.2),
    Movies(
      "Bheeshma Parvam",
      2022,
      "https://onlookersmedia.in/wp-content/uploads/2021/02/bheeshma-parvam-mammootty-amal-neerad-new-film-2.jpg",
      9.2,
    ),
    Movies(
        "Martin",
        2023,
        "https://stat5.bollywoodhungama.in/wp-content/uploads/2023/02/Martin.jpg",
        9.8),
    Movies(
        "After",
        2023,
        "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180",
        9.1)
  ];

  List<Movies> display_list = List.from(movies_list);

  void UpdateList(String value) {
    setState(() {
      display_list = movies_list
          .where(
            (element) => element.movie_title.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Latest Movies',
              style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => UpdateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff302360),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.purple.shade900),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: display_list.length == 0
                  ? Center(
                      child: Text(
                        'Not Result Found',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          display_list[index].movie_title,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${display_list[index].movie_release_year!}',
                          style: TextStyle(color: Colors.white60),
                        ),
                        trailing: Text(
                          '${display_list[index].rating}',
                          style: TextStyle(color: Colors.amber.shade400),
                        ),
                        leading: Hero(
                          tag: display_list[index].movie_title,
                          child: Image.network(
                              display_list[index].movie_poster_url!),
                        ),
                        onTap: () {
                          // Navigator.of(context).pop();
                        },
                        // leading:  Image.network(
                        //     display_list[index].movie_poster_url!),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
