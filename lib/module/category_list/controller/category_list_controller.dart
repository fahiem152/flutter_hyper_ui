
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/category_list_view.dart';

class CategoryListController extends State<CategoryListView> {
    static late CategoryListController instance;
    late CategoryListView view;

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    