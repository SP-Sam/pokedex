import 'package:flutter/material.dart';
import 'package:pokedex/helpers/poke_helper.dart';

import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/metric_tile.dart';
import 'package:pokedex/widgets/poke_ability_chip.dart';
import 'package:pokedex/widgets/poke_header.dart';
import 'package:pokedex/widgets/horizontal_bar.dart';
import 'package:pokedex/widgets/poke_type_chip.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel? pokemon;

  const DetailPage({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.pokemon!.name!,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: PokeHelper.getColor(widget.pokemon!.type1!),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Container(
          height: 52,
          width: 80,
          child: Center(
            child: Text(
              '#${widget.pokemon!.id.toString().padLeft(4, '0')}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PokeHeader(
          backgroundColor: PokeHelper.getColor(widget.pokemon!.type1!),
          imageUrl: widget.pokemon!.imageUrl,
        ),
        _buildTypes(),
        _buildMetrics(),
        _buildAbility(),
        _buildStats(),
      ],
    );
  }

  Widget _buildAbility() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PokeAbilityChip(ability: widget.pokemon!.ability1),
        Icon(Icons.brightness_auto_outlined),
        PokeAbilityChip(ability: widget.pokemon!.ability2),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Estatísticas',
              textAlign: TextAlign.center,
            ),
          ),
          HorizontalBar(
            label: 'HP',
            currentValue: widget.pokemon!.health,
            foregroundColor: PokeHelper.getColor(widget.pokemon!.type1!),
          ),
          HorizontalBar(
            label: 'ATK',
            currentValue: widget.pokemon!.attack,
            foregroundColor: PokeHelper.getColor(widget.pokemon!.type1!),
          ),
          HorizontalBar(
            label: 'DEF',
            currentValue: widget.pokemon!.defense,
            foregroundColor: PokeHelper.getColor(widget.pokemon!.type1!),
          ),
          HorizontalBar(
            label: 'SPD',
            currentValue: widget.pokemon!.speed,
            foregroundColor: PokeHelper.getColor(widget.pokemon!.type1!),
          ),
        ],
      ),
    );
  }

  Widget _buildTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PokeTypeChip(type: widget.pokemon!.type1),
        widget.pokemon!.type2 != null ? SizedBox(width: 20) : SizedBox(),
        widget.pokemon!.type2 != null
            ? PokeTypeChip(type: widget.pokemon!.type2)
            : SizedBox(),
      ],
    );
  }

  Widget _buildMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MetricTile(
            value: widget.pokemon!.weight! / 10,
            unit: 'kg',
            label: 'Peso',
          ),
        ),
        Expanded(
          child: MetricTile(
            value: widget.pokemon!.height! / 10,
            unit: 'm',
            label: 'Altura',
          ),
        ),
      ],
    );
  }
}
