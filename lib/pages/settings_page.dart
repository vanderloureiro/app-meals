import 'package:app_meals/components/main_drawer.dart';
import 'package:app_meals/models/settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsPage(this.settings, this.onSettingsChanged, {Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  var settings = Settings();

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          Expanded(child:
          ListView(
            children: [
              _buildSwitch(
                'Sem gluten',
                'Só exibe refeições sem gluten!',
                settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value)
              ),
              _buildSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose!',
                  settings.isLactoseFree,
                      (value) => setState(() => settings.isLactoseFree = value)
              ),
              _buildSwitch(
                  'Vegana',
                  'Só exibe refeições veganas!',
                  settings.isVegan,
                      (value) => setState(() => settings.isVegan = value)
              ),
              _buildSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas!',
                  settings.isVegetarian,
                      (value) => setState(() => settings.isVegetarian = value)
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildSwitch(
      String title,
      String subtitle,
      bool value,
      Function(bool) onChangedParam) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChangedParam(value);
          widget.onSettingsChanged(settings);
        },
    );
  }
}
