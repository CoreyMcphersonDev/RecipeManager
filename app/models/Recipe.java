package models;

import javax.persistence.*;


@Entity
@Table(name = "Recipe")
public class Recipe
{
    public static final int RECIPE_NAME_MAX_LENGTH = 100;
    public static final int RECIPE_NAME_MIN_LENGTH = 3;




    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "recipeId")
    private int recipeId;

    @Column(name = "recipeName")
    private String recipeName;

    @Column(name = "recipeTimeCookMinutes")
    private int timeCook;

    @Column(name = "recipeTimePrepMinutes")
    private int timePrep;

    @Column(name = "totalTime")
    private int totalTime;

    @Column(name = "serves")
    private int serves;

    @Column(name = "photo")
    private byte[] photo;

    @Column(name = "photoPath")
    private String photoPath;

    @Column(name = "recipeInstructions")
    private String instructions;

    @Column(name = "recipeSource")
    private String source;

    @Column(name = "foodArtistId")
    private int foodArtistId;

    @Column(name = "recipeCategoryId")
    private Integer categoryId;

    @Column(name = "recipeCuisineId")
    private Integer cuisineId;

    @Column(name = "difficultyRatingId")
    private Integer difficultyRatingId;


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

    public int getTimeCook()
    {
        return timeCook;
    }

    public void setTimeCook(int timeCook)
    {
        this.timeCook = timeCook;
    }

    public int getTimePrep()
    {
        return timePrep;
    }

    public void setTimePrep(int timePrep)
    {
        this.timePrep = timePrep;
    }

    public int getTotalTime()
    {
        return totalTime;
    }

    public void setTotalTime(int totalTime)
    {
        this.totalTime = totalTime;
    }

    public int getServes()
    {
        return serves;
    }

    public void setServes(int serves)
    {
        this.serves = serves;
    }

    public byte[] getPhoto()
    {
        return photo;
    }

    public void setPhoto(byte[] photo)
    {
        this.photo = photo;
    }

    public String getPhotoPath()
    {
        return photoPath;
    }

    public void setPhotoPath(String photoPath)
    {
        this.photoPath = photoPath;
    }

    public String getInstructions()
    {
        return instructions;
    }

    public void setInstructions(String instructions)
    {
        this.instructions = instructions;
    }

    public String getSource()
    {
        return source;
    }

    public void setSource(String source)
    {
        this.source = source;
    }

    public int getFoodArtistId()
    {
        return foodArtistId;
    }

    public void setFoodArtistId(int foodArtistId)
    {
        this.foodArtistId = foodArtistId;
    }

    public Integer getCategoryId()
    {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId)
    {
        this.categoryId = categoryId;
    }

    public Integer getCuisineId()
    {
        return cuisineId;
    }

    public void setCuisineId(Integer cuisineId)
    {
        this.cuisineId = cuisineId;
    }

    public Integer getDifficultyRatingId()
    {
        return difficultyRatingId;
    }

    public void setDifficultyRatingId(Integer difficultyRatingId)
    {
        this.difficultyRatingId = difficultyRatingId;
    }
}

