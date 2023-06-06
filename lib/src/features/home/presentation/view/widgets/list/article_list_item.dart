import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';

import 'article_more_detail.dart';
import 'favorite_button.dart';

class ArticleListItem extends StatefulWidget {
  const ArticleListItem({
    super.key,
    required this.article,
    this.isFav = false,
  });

  final ArticleModel article;
  final bool isFav;

  @override
  State<ArticleListItem> createState() => _ArticleListItemState();
}

class _ArticleListItemState extends State<ArticleListItem> {
  Widget get _title => Text(
        widget.article.titulo ?? widget.article.tituloEn!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          overflow: _expand ? TextOverflow.clip : TextOverflow.ellipsis,
        ),
      );

  Widget get _expandButton => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _expand = !_expand;
              });
            },
            child: Row(
              children: [
                _expand
                    ? Container()
                    : Text(
                        'Ver mais',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                _expand == true
                    ? Icon(
                        Icons.expand_less,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : Icon(
                        Icons.expand_more,
                        color: Theme.of(context).colorScheme.primary,
                      ),
              ],
            ),
          ),
        ],
      );

  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _expand = !_expand;
        });
      },
      child: AnimatedSize(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 300),
        child: Container(
          // color: Color(0xfff5f5f7),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: _title,
                trailing: widget.isFav
                    ? null
                    : FavoriteButton(article: widget.article),
                subtitle: Text('${widget.article.anoProducao}'),
              ),
              _expand == true
                  ? ArticleMoreDetail(article: widget.article)
                  : Container(),
              _expandButton,
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
