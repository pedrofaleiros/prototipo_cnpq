import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/favorite_viewmodel.dart';
import 'package:provider/provider.dart';

import 'article_more_detail.dart';
import 'favorite_button.dart';

class ArticleListItem extends StatefulWidget {
  const ArticleListItem({super.key, required this.article});

  final ArticleModel article;

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
                    ? Text(
                        'Ver menos',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
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
    return AnimatedSize(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 300),
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: _title,
                trailing: FavoriteButton(article: widget.article),
                subtitle: Text('${widget.article.anoProducao}'),
              ),
            ),
            _expand == true
                ? ArticleMoreDetail(article: widget.article)
                : Container(),
            _expandButton,
          ],
        ),
      ),
    );
  }
}
