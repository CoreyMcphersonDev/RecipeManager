package controllers;


import models.Ingredient;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Result;
import views.html.recipes;

import javax.inject.Inject;
import javax.persistence.Query;
import java.util.List;

public class IngredientController extends BaseController
{
    private final FormFactory formFactory;
    private final JPAApi jpaApi;

    @Inject
    public IngredientController(FormFactory formFactory, JPAApi jpaApi)
    {
        this.formFactory = formFactory;
        this.jpaApi = jpaApi;
    }

    @Transactional(readOnly = true)
    public Result getIngredient(Integer id)
    {
        Ingredient ingredient =
               jpaApi.em().createQuery("SELECT i FROM Ingredient WHERE ingredientId = :id", Ingredient.class).setParameter("id", id).getResultList();

        Query ingredientsQuery = jpaApi.em().createQuery("SELECT i FROM Ingredient i WHERE ingredientId <> :id ORDER BY ingredientName", Ingredient.class);

        ingredientsQuery.setParameter("id", id).getResultList();

        List<Ingredient> ingredients = ingredientsQuery.getResultList();
        Ingredient none = new Ingredient();
        none.setIngredientId(-1);
        ingredients.add(0, none);

        return ok(views.html.recipe.render(ingredient, ingredients));
    }

    @Transactional
    public Result getIngredients()
    {
        List<Ingredient> ingredients = jpaApi.em()
                .createQuery("SELECT i FROM Ingredient i ORDER BY ingredientName", Ingredient.class).getResultList();

        return ok(views.html.recipes.render(ingredients));

    }

    @Transactional
    public Result getIngredientsNativeQuery()
    {
        List<Ingredient> ingredients = jpaApi.em().createNativeQuery("SELECT ingredientId, ingredientName FROM Ingredient i ORDER BY ingredientName",
                Ingredient.class).getResultList();

        return ok(views.html.recipes.render(ingredients));

    }

}
