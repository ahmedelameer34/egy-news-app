import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/modules/webview/webview.dart';
import 'package:flutter_news_app/shared/colors.dart';

Widget articlesBuilder(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text('${article['publishedAt']}',
                        style: const TextStyle(color: Colors.grey, fontSize: 16))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
Widget buildArticle(list, context, {bool? isSearch=false}) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: ((context) => ListView.separated(
        itemBuilder: (context, index) => articlesBuilder(list[index], context),
        separatorBuilder: (context, index) => Container(
              height: 1,
              color: Colors.grey,
            ),
        itemCount: list.length)),
    fallback: (context) =>
        isSearch! ? Container() : const Center(child: CircularProgressIndicator()));

Widget defTextFormField(
        {required TextEditingController controller,
        required TextInputType textType,
        Function()? onSubmit,
        required Function onChange,
        required Function validate,
        required String label,
        required IconData prefix,
        IconData? suffix,
        Function? onTap,
        bool isClickable = true,
        context}) =>
    TextFormField(
        controller: controller,
        keyboardType: textType,
        onTap: () {
          onTap!();
        },
        onChanged: (s) {
          onChange(s);
        },
        onFieldSubmitted: (s) {
          onSubmit!();
        },
        validator: (s) => validate(s),
        enabled: isClickable,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefix,
            size: 30,
            color: mainColor,
          ),
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodyText1,
        ));

void navigateTo(context,Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
