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
    private String photo;

    @Column(name = "photoPath")
    private String photoPath;

    @Column(name = "recipeInstructions")
    private String recipeInstructions;

    @Column(name = "recipeSource")
    private String recipeSource;

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

    public String getPhoto()
    {
        return photo;
    }

    public void setPhoto(String photo)
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

    public String getRecipeInstructions()
    {
        return recipeInstructions;
    }

    public void setRecipeInstructions(String recipeInstructions)
    {
        this.recipeInstructions = recipeInstructions;
    }

    public String getRecipeSource()
    {
        return recipeSource;
    }

    public void setRecipeSource(String recipeSource)
    {
        this.recipeSource = recipeSource;
    }
}

