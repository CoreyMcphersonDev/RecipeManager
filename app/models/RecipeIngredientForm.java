package models;


public class RecipeIngredientForm
{
    public String recipeId;
    public String ingredientId;
    public String recipeIngredientAmount;
    public String unitMeasure;
    public String ingredientNote;

    public int index;


    public RecipeIngredientForm(int index)
    {
        this.index = index;
    }


}
