import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';

  FiltersScreen(this.filters, this.setFilters);
  final Function setFilters;
  final Map<String, bool> filters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
  }

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters Screen'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.setFilters(filters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _glutenFree,
                onChanged: (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
                title: Text('Gluten Free'),
                subtitle: Text('Only Include Gluten Free Meals'),
              ),
              SwitchListTile(
                value: _vegetarian,
                onChanged: (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
                title: Text('Vegetarian'),
                subtitle: Text('Only Include Vegetarian Meals'),
              ),
              SwitchListTile(
                value: _vegan,
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
                title: Text('Vegan'),
                subtitle: Text('Only Include Vegan Meals'),
              ),
              SwitchListTile(
                value: _lactoseFree,
                onChanged: (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
                title: Text('Lactose Free'),
                subtitle: Text('Only Include Lactose Free Meals'),
              )
            ],
          ))
        ],
      ),
    );
  }
}
