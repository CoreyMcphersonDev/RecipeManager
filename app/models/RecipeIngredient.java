package models;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "recipeIngredient")
public class RecipeIngredient
{
    @Id
    @Column(name = "recipeId")
    private int recipeId;

    @Column(name = "ingredientId")
    private int ingredientId;

    @Column(name = "recipeIngredientAmount")
    private int recipeIngredientAmount;

    @Column(name = "unitMeasure")
    private int unitMeasure;

    @Column(name = "ingredientNote")
    private String ingredientNote;


    public int getRecipeId()
    {
        return recipeId;
    }

    public void setRecipeId(int recipeId)
    {
        this.recipeId = recipeId;
    }

    public int getIngredientId()
    {
        return ingredientId;
    }

    public void setIngredientId(int ingredientId)
    {
        this.ingredientId = ingredientId;
    }

    public int getRecipeIngredientAmount()
    {
        return recipeIngredientAmount;
    }

    public void setRecipeIngredientAmount(int recipeIngredientAmount)
    {
        this.recipeIngredientAmount = recipeIngredientAmount;
    }

    public int getUnitMeasure()
    {
        return unitMeasure;
    }

    public void setUnitMeasure(int unitMeasure)
    {
        this.unitMeasure = unitMeasure;
    }

    public String getIngredientNote()
    {
        return ingredientNote;
    }

    public void setIngredientNote(String ingredientNote)
    {
        this.ingredientNote = ingredientNote;
    }
}
