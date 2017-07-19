package models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class RecipeId
{
    @Id
    private  int recipeId;

    private String recipeName;


    public int getRecipeId()
    {
        return recipeId;
    }

    public void setRecipeId(int recipeId)
    {
        this.recipeId = recipeId;
    }

    public String getRecipeName()
    {
        return recipeName;
    }

    public void setRecipeName(String recipeName)
    {
        this.recipeName = recipeName;
    }
}
