import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/material_components/show_snack_bar.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/saved_viewmodel.dart';
import 'article_more_detail.dart';
import '../saved/save_article_button.dart';
import 'expand_button.dart';

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

  Widget? _trailing({
    required SavedViewModel controller,
  }) {
    if (widget.isFav) {
      if (MediaQuery.of(context).size.width > 450) {
        return IconButton(
          onPressed: () {
            controller.handle(widget.article);
            showSnackBar(
              context: context,
              controller: controller,
              article: widget.article,
            );
          },
          icon: Icon(
            Icons.bookmark,
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      }
    } else {
      return SaveArticleButton(article: widget.article);
    }

    return null;
  }

  bool _expand = false;

  void changeExpand() => setState(() {
        _expand = !_expand;
      });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SavedViewModel>(context, listen: false);

    return GestureDetector(
      onDoubleTap: changeExpand,
      child: AnimatedSize(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 300),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: _title,
                trailing: _trailing(controller: controller),
                subtitle: Text('${widget.article.anoProducao}'),
              ),
              _expand == true
                  ? ArticleMoreDetail(article: widget.article)
                  : Container(),
              ExpandButton(
                action: changeExpand,
                expand: _expand,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
