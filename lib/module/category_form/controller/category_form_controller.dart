
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/category_form_view.dart';

class CategoryFormController extends State<CategoryFormView> {
    static late CategoryFormController instance;
    late CategoryFormView view;

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
        
    