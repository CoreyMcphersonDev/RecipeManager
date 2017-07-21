package controllers;


import models.*;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Result;

import javax.inject.Inject;
import javax.persistence.Id;
import java.util.ArrayList;
import java.util.List;

public class MealHistoryController extends BaseController
{
    private final FormFactory formFactory;
    private final JPAApi jpaApi;

    @Inject
    public MealHistoryController(FormFactory formFactory, JPAApi jpaApi)
    {
        this.formFactory = formFactory;
        this.jpaApi = jpaApi;
    }


    @Transactional(readOnly = true)
    public Result getMealHistory()
    {
        Result result = unauthorized("NO SOUP FOR YOU!");

        if (loggedIn())
        {
           Recipe recipe = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE recipeId = :id",
                  Recipe.class).setParameter("id", getFoodArtistId()).getSingleResult();



           //Joining MealHistory table and Recipe table
            List<MealHistoryItem> mealHistories = jpaApi.em()
                    .createNativeQuery("SELECT m.mealHistoryId, m.foodArtistId, m.recipeId, m.tasteRatingId, m.mealMadeDate, r.recipeName," +
                            " r.recipeId FROM MealHistory m " +
                            "JOIN Recipe r ON r.recipeId = m.recipeId  WHERE m.foodArtistId = :id ORDER BY m.mealMadeDate", MealHistoryItem.class)
                    .setParameter("id", getFoodArtistId()).getResultList();

            result = ok(views.html.mealhistory.render(recipe, mealHistories));
        }
        return result;
    }

    @Transactional
    public Result addMealHistory()
    {
        List<String> errorMessages = new ArrayList<>();
        return ok(views.html.newmealhistory.render(new RecipeForm(), errorMessages));
    }


}
