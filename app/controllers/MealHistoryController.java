package controllers;


import models.Recipe;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Result;

import javax.inject.Inject;
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
        DynamicForm form = formFactory.form().bindFromRequest();
        Result result = unauthorized("INTRUDER ALERT");

        //GET FROM SESSION INSTEAD OF FROM THE FORM
        //int foodArtistId = Integer.parseInt(form.get("foodArtistId"));
        String foodArtistUserName = session().get("foodArtistId");

        if (loggedIn())
        {
            List<Recipe> recipes = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE foodArtistId = :id ORDER BY recipeName", Recipe.class)
                    .setParameter("id", session().get(foodArtistUserName)).getResultList();

            result = ok(views.html.mealhistory.render(recipes, foodArtistUserName));
        }
        return result;
    }




}
