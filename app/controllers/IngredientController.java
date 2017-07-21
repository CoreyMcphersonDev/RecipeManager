package controllers;


import models.Ingredient;
import models.IngredientForm;
import models.Recipe;
import play.Logger;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Result;

import javax.inject.Inject;
import javax.persistence.Query;
import java.util.ArrayList;
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
    public Result getIngredients()
    {
        List<Ingredient> ingredients = jpaApi.em()
                .createQuery("SELECT i FROM Ingredient i ORDER BY ingredientName", Ingredient.class).getResultList();

        return ok(views.html.ingredients.render(ingredients));
    }

    @Transactional
    public Result getIngredientsNativeQuery()
    {
        List<Ingredient> ingredients = jpaApi.em().createNativeQuery("SELECT ingredientId, ingredientName FROM Ingredient i ORDER BY ingredientName",
                Ingredient.class).getResultList();

        return ok(views.html.ingredients.render(ingredients));
    }



    public Result addIngredient()
    {
        List<String> errorMessages = new ArrayList<>();
        return ok(views.html.newingredient.render(new IngredientForm(), errorMessages));
    }

    @Transactional
    public Result addNewIngredient() throws Exception
    {
        Result result;

        List<String>errorMessages = new ArrayList<>();

        DynamicForm form = formFactory.form().bindFromRequest();

        IngredientForm ingredientForm = new IngredientForm();

        ingredientForm.ingredientName = form.get("ingredientName");

        boolean valid = true;

        if (ingredientForm.ingredientName == null || ingredientForm.ingredientName.length() < 3)
        {
            valid = false;
            errorMessages.add("Ingredient name must be at least three characters long");
        }
        if (valid)
        {

            Ingredient ingredient = new Ingredient();

            ingredient.setIngredientName(ingredientForm.ingredientName);

            jpaApi.em().persist(ingredient);

            result = redirect(routes.IngredientController.getIngredients());
        }
        else
        {
            result = ok(views.html.newingredient.render(ingredientForm, errorMessages));
        }

        return result;
    }

    @Transactional(readOnly = true)
    public Result ingredientSearch()
    {
        DynamicForm form = formFactory.form().bindFromRequest();

        String searchIngredientName = form.get("ingredientName");

        Query query = jpaApi.em().createQuery("SELECT i FROM Ingredient i " +
                "WHERE ingredientName LIKE :searchIngredientName ORDER BY ingredientName", Ingredient.class);

        query.setParameter("searchIngredientName", "%" + searchIngredientName + "%");

        List<Ingredient> ingredients = query.getResultList();

        //TODO NEED TO PUT IN A 'NO RESULTS FOUND' PAGE FOR GENERIC SEARCHES

        return ok(views.html.ingredients.render(ingredients));
    }

}
