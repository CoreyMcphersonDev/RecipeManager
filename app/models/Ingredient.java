package models;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Ingredient")
public class Ingredient
{
    @Id
    @Column(name = "ingredientId")
    private int ingredientId;

    @Column(name = "ingredientName")
    private String ingredientName;

    public int getIngredientId()
    {
        return ingredientId;
    }

    public void setIngredientId(int ingredientId)
    {
        this.ingredientId = ingredientId;
    }

    public String getIngredientName()
    {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName)
    {
        this.ingredientName = ingredientName;
    }
}
