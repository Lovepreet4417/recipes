import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  RecipeDetail(this.recipe);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState(recipe);
  }
}

class _RecipeDetailState extends State {
  int _sliderVal = 1;
  final Recipe recipe;

  _RecipeDetailState(this.recipe);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.label),
      ),
      
      body: SafeArea(
       
        child: Column(
          children: <Widget>[
            
            Container(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(recipe.imageUrl)),
            ),
          
            SizedBox(
              height: 4,
            ),
          
            Text(
              recipe.label,
              style: TextStyle(fontSize: 18),
            ),
         
            Expanded(
             
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = recipe.ingredients[index];
                 

                  return Text(
                      "${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}");
                },
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: "${_sliderVal * recipe.servings} servings",
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
    
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
