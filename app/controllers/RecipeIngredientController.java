package controllers;


import models.Recipe;
import models.RecipeIngredient;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Result;
import scala.Int;

import javax.persistence.Id;
import javax.persistence.Query;
import java.util.List;

public class RecipeIngredientController extends BaseController
{
    private final FormFactory formFactory;
    private final JPAApi jpaApi;

    public RecipeIngredientController(FormFactory formFactory, JPAApi jpaApi)
    {
        this.formFactory = formFactory;
        this.jpaApi = jpaApi;
    }

    @Transactional(readOnly = true)
    public Result getIngredient(Integer Id)
    {
        List<RecipeIngredient> recipeIngredient = jpaApi.em().createQuery("SELECT r FROM RecipeIngredient r WHERE recipeId = :id",
                RecipeIngredient.class).setParameter("id", Id).getResultList();

        Query recipeIngredientsQuery = jpaApi.em().createQuery("SELECT r FROM RecipeIngredient r WHERE recipeId <> :id " +
                "ORDER BY ingredientId", RecipeIngredient.class);

        recipeIngredientsQuery.setParameter("id", Id);
        List<RecipeIngredient> recipeIngredients = recipeIngredientsQuery.getResultList();

        RecipeIngredient none = new RecipeIngredient();
        none.setIngredientId(-1);
        recipeIngredients.add(0, none);

        return (ok(views.html.recipe.render((Recipe) recipeIngredient, recipeIngredients)));

    }

   /* @Transactional(readOnly = true)
    public Result getRecipeIngredients()
    {
        Result result = unauthorized("NO SOUP FOR YOU!");

        if (loggedIn())
        {
            List<RecipeIngredient> recipeIngredients =
                    jpaApi.em().createQuery("Select r FROM RecipeIngredients r WHERE recipeId = :id", RecipeIngredient.class)
                            .setParameter("id", ).getResultList();

            result = ok(views.html.recipe.render(recipeIngredients));
        }
        return result;
    }*/



}
