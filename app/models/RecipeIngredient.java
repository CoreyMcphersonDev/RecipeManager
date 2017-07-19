package models;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DecimalFormat;

@Entity
@Table(name = "recipeIngredient")
public class RecipeIngredient implements Serializable
{
    @Id
    @Column(name = "recipeId")
    private int recipeId;

    @Id
    @Column(name = "ingredientId")
    private int ingredientId;

    @Column(name = "recipeIngredientAmount")
    private BigDecimal recipeIngredientAmount;

    @Column(name = "unitMeasure")
    private String unitMeasure;

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

    public BigDecimal getRecipeIngredientAmount()
    {
        return recipeIngredientAmount;
    }

    public void setRecipeIngredientAmount(BigDecimal recipeIngredientAmount)
    {
        this.recipeIngredientAmount = recipeIngredientAmount;
    }

    public String getUnitMeasure()
    {
        return unitMeasure;
    }

    public void setUnitMeasure(String unitMeasure)
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
