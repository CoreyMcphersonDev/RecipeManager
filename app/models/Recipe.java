package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Recipe")
public class Recipe
{

    @Id
    @Column(name = "RecipeId")
    private int recipeId;

    @Column(name = "RecipeName")
    private String recipeName;

    @Column(name = "TimeToCook")
    private int timeToCook;

    @Column(name = )

}
