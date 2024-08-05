// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_declarations, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'movie_data.dart'; // 導入 movie_data.dart 檔案

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Movie(),
    );
  }
}

class Movie extends StatefulWidget {
  Movie({super.key});

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  // 當前選中的電影類型
  MovieType _selectedMovieType = MovieType.Action;

  @override
  Widget build(BuildContext context) {
    // 定義一個 List 來存儲 MovieType 的實例
    final movieTypes = MovieType.values;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        backgroundColor: Colors.pink[100], // 設置 AppBar 的背景色為馬卡龍粉色
      ),
      body: Column(
        children: [
          // 包裝 SizedBox 的 Container，增加背景色
          Container(
            height: 60,
            color: Colors.yellow[100], // 設置背景色為馬卡龍黃色
            child: SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: movieTypes.map((movieType) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMovieType = movieType;
                        });
                      },
                      child: Container(
                        width: 70,
                        height: 35,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[300], // 設置按鈕區域的背景色為馬卡龍藍色
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            _getMovieTypeName(movieType),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          // 另一個水平滾動的 widget 區域
          Expanded(
            child: Container(
              color: Colors.green[100], // 設置背景色為馬卡龍綠色
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: movies[_selectedMovieType]!.map((movie) {
                    final imagePath = 'assets/movie/${_getMovieTypeName(_selectedMovieType)}/$movie.png';
                    // final imagePath = 'assets/movie/Action/Black Panther.png';
                    print(imagePath); // 印出抓到的檔案路徑

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // 加入這行
                      children: [
                        const SizedBox(height: 8.0), // 增加間距
                        Container(
                          width: 200/ 6 * 4,
                          height: 200, // 設置容器高度為 200
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.green[400], // 設置 Expanded 區域的背景色為馬卡龍綠色
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0), // 可選，為圖片添加圓角
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover, // 填滿容器並保持比例
                              errorBuilder: (context, error, stackTrace) {
                                // 如果圖片加載錯誤，顯示一個錯誤提示
                                return Center(child: Text('Image not found'));
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        // 類型
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _getMovieTypeName(_selectedMovieType),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        // 電影標題
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 200 / 6 * 4,
                            child: Wrap(
                            children: [
                              Text(
                              movie,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ],
                          ),
                        )
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  // 根據 MovieType 列舉返回相應的名稱
  String _getMovieTypeName(MovieType movieType) {
    switch (movieType) {
      case MovieType.Action:
        return 'Action';
      case MovieType.Comedy:
        return 'Comedy';
      case MovieType.Drama:
        return 'Drama';
      case MovieType.Horror:
        return 'Horror';
      case MovieType.SciFi:
        return 'SciFi'; // 確保與資料夾名稱一致
      default:
        return '';
    }
  }
}
