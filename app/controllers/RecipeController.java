package controllers;

import models.MealHistory;
import models.Recipe;
import models.RecipeForm;
import play.Logger;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Result;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.persistence.Query;
import java.util.List;

import static play.mvc.Results.unauthorized;


public class RecipeController extends BaseController
{

    //TODO: PUT IN A 'NO RESULTS FOUND' PAGE FOR GENERIC SEARCHES

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
                        .setParameter("id", id).getSingleResult();

        Query recipesQuery = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE recipeId <> :id ORDER BY recipeName", Recipe.class);

        recipesQuery.setParameter("id", id).getResultList();

        List<Recipe> recipes = recipesQuery.getResultList();
        Recipe none = new Recipe();
        none.setRecipeId(-1);
        recipes.add(0, none);

        return ok(views.html.recipe.render(recipe, recipes));

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

    @Transactional
    public Result getRecipesNativeQuery()
    {
        List<Recipe> recipes = jpaApi.em().createNativeQuery("SELECT recipeId, recipeName, recipeInstructions FROM Recipe r ORDER BY recipeName",
                Recipe.class).getResultList();

        return ok(views.html.recipes.render(recipes));
    }

    @Transactional(readOnly = true)
    public Result recipeSearch()
    {
        DynamicForm form = formFactory.form().bindFromRequest();

        String searchRecipeName = form.get("recipeName");
        Logger.debug(searchRecipeName);

        Query query = jpaApi.em().createQuery("SELECT r FROM Recipe r " +
                "WHERE recipeName LIKE :searchRecipeName ORDER BY recipeName", Recipe.class);
        query.setParameter("searchRecipeName", searchRecipeName + "%");
        List<Recipe> recipes = query.getResultList();

        //NEED TO PUT IN A 'NO RESULTS FOUND' PAGE FOR GENERIC SEARCHES


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
        recipeForm.timeCook = form.get("recipetimecookminutes");
        recipeForm.timePrep = form.get("recipetimeprepminutes");
        recipeForm.totalTime = form.get("totaltime");
        recipeForm.serves = form.get("serves");
        recipeForm.instructions = form.get("recipeinstructions");
        recipeForm.source = form.get("recipesource");



        Recipe recipe = new Recipe();

        recipe.setRecipeName(recipeForm.recipeName);
        recipe.setTimeCook(Integer.parseInt(recipeForm.timeCook));
        recipe.setTimePrep(Integer.parseInt(recipeForm.timePrep));
        recipe.setTotalTime(Integer.parseInt(recipeForm.totalTime));
        recipe.setServes(Integer.parseInt(recipeForm.serves));
        recipe.setInstructions(recipeForm.instructions);
        recipe.setSource(recipeForm.source);

        jpaApi.em().persist(recipe);
        result = redirect(routes.RecipeController.getRecipes());

        return result;
    }

    @Transactional
    public Result updateRecipe()
    {
        DynamicForm form = formFactory.form().bindFromRequest();
        int recipeId = Integer.parseInt(form.get("id"));
        String name = form.get("recipeName");
        int timeCook = Integer.parseInt(form.get("recipeTimeCookMinutes"));
        int timePrep = Integer.parseInt(form.get("recipeTimePrepMinutes"));
        int totalTime = Integer.parseInt(form.get("totalTime"));
        int serves = Integer.parseInt(form.get("serves"));
        String instructions = form.get("recipeInstructions");
        String source = form.get("recipeSource");

        Recipe recipe = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE recipeId = :id",
                Recipe.class).setParameter("id", recipeId).getSingleResult();

        recipe.setRecipeName(name);
        recipe.setTimeCook(timeCook);
        recipe.setTimePrep(timePrep);
        recipe.setTotalTime(totalTime);
        recipe.setServes(serves);
        recipe.setInstructions(instructions);
        recipe.setSource(source);

        jpaApi.em().persist(recipe);

        return redirect(routes.RecipeController.getRecipes());
    }

    @Transactional(readOnly = true)
    public Result getMealHistory()
    {
        DynamicForm form = formFactory.form().bindFromRequest();
        Result result = unauthorized("INTRUDER ALERT");
        int foodARtistId = Integer.parseInt(form.get("foodArtistId"));

        if (loggedIn())
        {
            List<Recipe> recipes = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE foodArtistId =:id ORDER BY recipeName", Recipe.class)
                    .setParameter("id", foodARtistId).getResultList();

            result = ok(views.html.recipes.render(recipes));
        }
        return result;
    }


}
