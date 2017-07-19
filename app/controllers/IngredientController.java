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
    public Result getIngredient(Integer id)
    {
        List<Ingredient> ingredient =
               jpaApi.em().createQuery("SELECT i FROM Ingredient WHERE ingredientId = :id", Ingredient.class).setParameter("id", id).getResultList();

        Query ingredientsQuery = jpaApi.em().createQuery("SELECT i FROM Ingredient i WHERE ingredientId <> :id ORDER BY ingredientName", Ingredient.class);

        ingredientsQuery.setParameter("id", id).getResultList();

        List<Ingredient> ingredients = ingredientsQuery.getResultList();
        Ingredient none = new Ingredient();
        none.setIngredientId(-1);
        ingredients.add(0, none);

        return ok(views.html.ingredients.render(ingredient));
    }

    @Transactional
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

    @Transactional
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

        Ingredient ingredient = new Ingredient();

        ingredient.setIngredientName(ingredientForm.ingredientName);

        jpaApi.em().persist(ingredient);

       result = redirect(routes.IngredientController.getIngredients());

       return result;
    }

    @Transactional(readOnly = true)
    public Result ingredientSearch()
    {
        DynamicForm form = formFactory.form().bindFromRequest();

        String searchIngredientName = form.get("ingredientName");

        Logger.debug(searchIngredientName);

        Query query = jpaApi.em().createQuery("SELECT i FROM Ingredient i " +
                "WHERE ingredientName LIKE :searchIngredientName ORDER BY ingredientName", Ingredient.class);
        query.setParameter("searchIngredientName", searchIngredientName + "%");

        List<Ingredient> ingredients = query.getResultList();

        //TODO NEED TO PUT IN A 'NO RESULTS FOUND' PAGE FOR GENERIC SEARCHES

        return ok(views.html.ingredients.render(ingredients));
    }

}
