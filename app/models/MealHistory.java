package models;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "MealHistory")
public class MealHistory
{
    @Id
    @Column(name = "mealHistoryId")
    private int mealHistoryId;

    @Column(name = "recipeId")
    private int recipeId;

    @Column(name = "foodArtistId")
    private int foodArtistId;

    @Column(name = "tasteRatingId")
    private int tasteRatingId;

    @Column(name = "mealMadeDate")
    private Date mealMadeDate;


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

    public int getFoodArtistId()
    {
        return foodArtistId;
    }

    public void setFoodArtistId(int foodArtistId)
    {
        this.foodArtistId = foodArtistId;
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
