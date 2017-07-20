package controllers;

import com.google.common.io.Files;
import models.*;
import play.Logger;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.BodyParser;
import play.mvc.Http;
import play.mvc.Result;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
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
    public Result getRecipe(Integer Id)
    {
        Recipe recipe = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE recipeId = :id",
                Recipe.class).setParameter("id", Id).getSingleResult();

        List<IngredientItem> ingredients = jpaApi.em().
                createNativeQuery("SELECT r.recipeId, r.ingredientId, i.ingredientName, " +
                                "r.recipeIngredientAmount, r.unitMeasure, r.ingredientNote " +
                                "FROM Ingredient i JOIN RecipeIngredient r ON r.ingredientId = i.ingredientId " +
                                "WHERE r.recipeId = :id",
                        IngredientItem.class).setParameter("id", Id).getResultList();

         //Query recipeCuisineQuery = jpaApi.em().createQuery("SELECT recipeCuisineId FROM Recipe r WHERE recipeId = :id",
                //Recipe.class);



        Query recipeIngredientsQuery = jpaApi.em().createQuery("SELECT r FROM RecipeIngredient r WHERE recipeId <> :id " +
                "ORDER BY ingredientId", RecipeIngredient.class);

        recipeIngredientsQuery.setParameter("id", Id);
        List<RecipeIngredient> recipeIngredients = recipeIngredientsQuery.getResultList();

        RecipeIngredient none = new RecipeIngredient();
        none.setIngredientId(-1);
        recipeIngredients.add(0, none);

        return (ok(views.html.recipe.render(recipe, ingredients)));
    }


    @Transactional(readOnly = true)
    public Result getRecipes()
    {
        Result result = unauthorized("NO SOUP FOR YOU!");

        if (loggedIn())
        {
           List<Recipe> recipes = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE foodArtistId = :id ORDER BY recipeName", Recipe.class)
                   .setParameter("id", getFoodArtistId()).getResultList();

           result = ok(views.html.recipes.render(recipes));
        }
        return result;
    }

    @Transactional
    public Result getRecipesNativeQuery()
    {
        String foodArtistId = session().get("foodArtistId");


        List<Recipe> recipes = jpaApi.em().createNativeQuery("SELECT recipeId, recipeName, recipeInstructions " +
                        "FROM Recipe r ORDER BY recipeName",
                Recipe.class).setParameter("id", session().get(foodArtistId)).getResultList();

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

        //TODO NEED TO PUT IN A 'NO RESULTS FOUND' PAGE FOR GENERIC SEARCHES

        return ok(views.html.recipes.render(recipes));
    }


    @Transactional
    public Result addRecipe()
    {
        List<String> errorMessages = new ArrayList<>();
        return ok(views.html.newrecipe.render(new RecipeForm(), errorMessages));
    }


    @Transactional
    public Result addNewRecipe() throws Exception
    {
        Result result;

        //TODO: define error messages
        List<String> errorMessages = new ArrayList<>();

        DynamicForm form = formFactory.form().bindFromRequest();
        IngredientForm ingredientForm = new IngredientForm();
        RecipeIngredientForm recipeIngredientForm = new RecipeIngredientForm();

        //Get
        RecipeForm recipeForm = new RecipeForm();
        recipeForm.recipeName = form.get("recipename");
        recipeForm.timeCook = form.get("recipetimecookminutes");
        recipeForm.timePrep = form.get("recipetimeprepminutes");
        recipeForm.totalTime = form.get("totaltime");
        recipeForm.serves = form.get("serves");

        ingredientForm.ingredientName = form.get("ingredientName");

        recipeIngredientForm.recipeIngredientAmount = form.get("recipeIngredientAmount");
        recipeIngredientForm.unitMeasure = form.get("unitMeasure");
        recipeIngredientForm.ingredientNote = form.get("ingredientNote");

        recipeForm.instructions = form.get("recipeInstructions");
        recipeForm.source = form.get("recipeSource");

        Recipe recipe = new Recipe();
        Ingredient ingredient = new Ingredient();
        RecipeIngredient recipeIngredient = new RecipeIngredient();

        //Set
        recipe.setRecipeName(recipeForm.recipeName);
        recipe.setTimeCook(Integer.parseInt(recipeForm.timeCook));
        recipe.setTimePrep(Integer.parseInt(recipeForm.timePrep));
        recipe.setTotalTime(Integer.parseInt(recipeForm.totalTime));
        recipe.setServes(Integer.parseInt(recipeForm.serves));
        recipe.setInstructions(recipeForm.instructions);
        recipe.setSource(recipeForm.source);

        ingredient.setIngredientName(ingredientForm.ingredientName);

        //TODO: cast BigDecimal recipeIngredientAmount to string
        //recipeIngredient.setRecipeIngredientAmount(toString(recipeIngredientForm.recipeIngredientAmount));
        recipeIngredient.setUnitMeasure(recipeIngredientForm.unitMeasure);
        recipeIngredient.setIngredientNote(recipeIngredientForm.ingredientNote);


        jpaApi.em().persist(recipe);
        jpaApi.em().persist(ingredient);

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

        String ingredientName = form.get("ingredientName");
        String ingredientId = form.get("ingredientId");

        Recipe recipe = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE recipeId = :id",
                Recipe.class).setParameter("id", recipeId).getSingleResult();


        List<RecipeIngredient> ingredients = jpaApi.em().createQuery("SELECT r FROM RecipeIngredient r WHERE recipeId = :id",
                RecipeIngredient.class).setParameter("id", recipeId).getResultList();


        recipe.setRecipeName(name);
        recipe.setTimeCook(timeCook);
        recipe.setTimePrep(timePrep);
        recipe.setTotalTime(totalTime);
        recipe.setServes(serves);
        recipe.setInstructions(instructions);
        recipe.setSource(source);


        jpaApi.em().persist(recipe);
        jpaApi.em().persist(ingredients);


        return redirect(routes.RecipeController.getRecipes());
    }


    @Transactional
    @BodyParser.Of(UploadMultipartFormDataBodyParser.class)
    public Result uploadPicture() throws IOException
    {
        final Http.MultipartFormData<File> formData = request().body().asMultipartFormData();
        final Http.MultipartFormData.FilePart<File> filePart = formData.getFile("filename");
        final File file = filePart.getFile();
        Logger.debug(file.getName());


        DynamicForm form = formFactory.form().bindFromRequest();
        int id = Integer.parseInt(form.get("id"));

        Recipe recipe = jpaApi.em().createQuery("SELECT r FROM Recipe r WHERE id = :id", Recipe.class)
                .setParameter("id", id).getSingleResult();

        byte[] photo = Files.toByteArray(file);
        recipe.setPhoto(photo);
        jpaApi.em().persist(recipe);

        return ok(file.getName());
    }


    @Transactional(readOnly = true)
    public Result getPicture(Integer id)
    {
        Logger.debug(""+id);

        Recipe recipe = (Recipe)jpaApi.em()
                .createQuery("SELECT r FROM Recipe r where recipeId = :id").setParameter("id", id).getSingleResult();

       return ok(recipe.getPhoto()).as("image/bmp");


    }


}
