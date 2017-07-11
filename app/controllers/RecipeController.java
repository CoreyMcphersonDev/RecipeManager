package controllers;

import models.Password;
import models.Recipe;
import models.RecipeForm;
import org.hibernate.sql.Select;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Result;

import java.rmi.activation.ActivationGroup_Stub;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.persistence.Query;
import java.util.List;

import static play.mvc.Results.unauthorized;

public class RecipeController extends BaseController
{
    private final FormFactory formFactory;
    private final JPAApi jpaApi;


    @Inject
    public RecipeController(FormFactory formFactory, JPAApi jpaApi)
    {
        this.formFactory = formFactory;
        this.jpaApi = jpaApi;
    }

    @Transactional(readOnly = true)
    public Result getRecipe(Integer id)
    {
        Recipe recipe =
                jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE recipeId = :id", Recipe.class)
                        .setParameter("recipeId", id).getSingleResult();

        Query recipesQuery = (Query) jpaApi.em().createQuery("SELECT r FROM recipe WHERE recipeId <> :id", Recipe.class)
                .setParameter("recipeId", id).getResultList();

        recipesQuery.setParameter("recipeId", id).getResultList();

        List<Recipe> recipes = recipesQuery.getResultList();
        Recipe none = new Recipe();
        none.setRecipeId(-1);
        recipes.add(0, none);

        return ok(views.html.recipe.render());
    }


    @Transactional(readOnly = true)
    public Result getRecipes()
    {
        Result result = unauthorized("INTRUDER ALERT");

        if (loggedIn())
        {
           List<Recipe> recipes = jpaApi.em().createQuery("SELECT r FROM Recipe r ORDER BY recipeName", Recipe.class).getResultList();

            result = ok(views.html.recipes.render(recipes));
        }
        return result;
    }

    @Transactional(readOnly = true)
    public Result getRecipesNativeQuery()
    {
        List<Recipe> recipes = jpaApi.em().createNativeQuery("Select recipeId, recipeName, recipeTimeCookMinutes," +
                        "recipeTimePrepMinutes, totalTime, serves, FROM Recipe r ORDER BY recipeName, recipeId",
                Recipe.class).getResultList();

        return ok(views.html.recipe.render());
    }

    @Transactional(readOnly = true)
    public Result recipeSearch()
    {
        DynamicForm form = formFactory.form().bindFromRequest();

        String searchRecipeName = form.get("recipeName");

        Query query = jpaApi.em().createNativeQuery("SELECT recipeId, recipeName, totaltime FROM Recipe r WHERE recipeName LIKE: :name ORDER BY recipename", Recipe.class);
        query.setParameter("name", searchRecipeName + "%");
        List<Recipe> recipes = query.getResultList();

        return ok(views.html.recipes.render(recipes));

    }

    @Transactional
    public Result addRecipe()
    {

        List<String> errorMessages = new ArrayList<>();
        return ok(views.html.newrecipe.render());
    }

    @Transactional
    public Result addNewRecipe() throws Exception
    {
        Result result;
        List<String> errorMessages = new ArrayList<>();

        DynamicForm form = formFactory.form().bindFromRequest();

        RecipeForm recipeForm = new RecipeForm();
        recipeForm.recipeName = form.get("recipename");
        recipeForm.recipeTimeCookMinutes = form.get("recipetimecookminutes");
        recipeForm.recipeTimePrepMinutes = form.get("recipetimeprepminutes");
        recipeForm.totalTime = form.get("totaltime");
        recipeForm.serves = form.get("serves");
        recipeForm.recipeInstructions = form.get("recipeinstructions");
        recipeForm.recipeSource = form.get("recipesource");



        Recipe recipe = new Recipe();

        recipe.setRecipeName(recipeForm.recipeName);
        recipe.setTimeCook(Integer.parseInt(recipeForm.recipeTimeCookMinutes));
        recipe.setTimePrep(Integer.parseInt(recipeForm.recipeTimePrepMinutes));
        recipe.setTotalTime(Integer.parseInt(recipeForm.totalTime));
        recipe.setServes(Integer.parseInt(recipeForm.serves));
        recipe.setRecipeInstructions(recipeForm.recipeInstructions);
        recipe.setRecipeInstructions(recipeForm.recipeSource);

        jpaApi.em().persist(recipe);
        result = redirect(routes.RecipeController.getRecipes());

        return result;

    }

}
