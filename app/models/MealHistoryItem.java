package models;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;


//Model combining Recipe table and MealHistory table

@Entity
public class MealHistoryItem
{
    @Id
    @Column(name = "mealHistoryId")
    private int mealHistoryId;
    //mealHistory table

    @Column(name = "recipeId")
    private int recipeId;
    //mealHistory table

    @Column(name = "foodArtistId")
    private int foodArtistId;
    //mealHistory table

    @Column(name = "tasteRatingId")
    private int tasteRatingId;
    //mealHistory table

    @Column(name = "mealMadeDate")
    private Date mealMadeDate;
    //mealHistory table

    @Column(name = "recipeName")
    private String recipeName;
    //Recipe table

    public int getMealHistoryId()
    {
        return mealHistoryId;
    }

    public void setMealHistoryId(int mealHistoryId)
    {
        this.mealHistoryId = mealHistoryId;
    }

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

    public int getTasteRatingId()
    {
        return tasteRatingId;
    }

    public void setTasteRatingId(int tasteRatingId)
    {
        this.tasteRatingId = tasteRatingId;
    }

    public Date getMealMadeDate()
    {
        return mealMadeDate;
    }

    public void setMealMadeDate(Date mealMadeDate)
    {
        this.mealMadeDate = mealMadeDate;
    }
}
