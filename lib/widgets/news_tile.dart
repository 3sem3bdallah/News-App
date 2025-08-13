import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: newsModel.image != null && newsModel.image!.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: newsModel.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          strokeWidth: 2,
                          color: Colors.blue,
                        ),
                      ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.error, color: Colors.red),
                  ),
                )
              : Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                ),
        ),

        const SizedBox(height: 12),
        Text(
          newsModel.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          newsModel.subTitle ?? ' ',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
