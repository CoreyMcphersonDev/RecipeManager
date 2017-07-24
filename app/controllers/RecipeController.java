package controllers;

import com.google.common.io.Files;
import models.*;
import play.Logger;
import play.data.DynamicForm;
import play.data.Form;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.BodyParser;
import play.mvc.Http;
import play.mvc.Result;
import validators.NumberValidator;

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

    @Transactional(readOnly = true)
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
        query.setParameter("searchRecipeName", "%" + searchRecipeName + "%");

        List<Recipe> recipes = query.getResultList();

        //TODO NEED TO PUT IN A 'NO RESULTS FOUND' PAGE FOR GENERIC SEARCHES

        return ok(views.html.recipes.render(recipes));
    }


    @Transactional
    public Result addRecipe()
    {
        List<String> errorMessages = new ArrayList<>();

        List<RecipeIngredientForm> recipeIngredientForms = new ArrayList<>();

        RecipeIngredientForm  recipeIngredientForm = new RecipeIngredientForm(1);

        recipeIngredientForms.add(recipeIngredientForm);

        List<Ingredient> ingredients = jpaApi.em()
                .createQuery("SELECT i FROM Ingredient i ORDER BY ingredientName", Ingredient.class).getResultList();

               return ok(views.html.newrecipe.render(new RecipeForm(),  errorMessages, ingredients, recipeIngredientForms));
    }


    @Transactional
    public Result addNewRecipe() throws Exception
    {
        Result result;

        List<Ingredient> ingredients = jpaApi.em()
                .createQuery("SELECT i FROM Ingredient i ORDER BY ingredientName", Ingredient.class).getResultList();

        List<String> errorMessages = new ArrayList<>();

        DynamicForm form = formFactory.form().bindFromRequest();

        List<RecipeIngredientForm> recipeIngredientForms = new ArrayList<>();

        //Get
        RecipeForm recipeForm = new RecipeForm();
        recipeForm.recipeName = form.get("recipeName");
        recipeForm.timeCook = form.get("recipeTimeCookMinutes");
        recipeForm.timePrep = form.get("recipeTimePrepMinutes");
        recipeForm.totalTime = form.get("totalTime");
        recipeForm.serves = form.get("serves");
        recipeForm.instructions = form.get("recipeInstructions");
        recipeForm.source = form.get("recipeSource");
        recipeForm.difficultyRatingId = form.get("difficultyRatingId");

        int recipeIngredientIndex = 1;


        while (form.get("ingredientId" + recipeIngredientIndex) != null && recipeIngredientIndex < 100)
        {
            RecipeIngredientForm recipeIngredientForm = new RecipeIngredientForm(recipeIngredientIndex);
            recipeIngredientForm.ingredientId = form.get("ingredientId" + recipeIngredientIndex);
            recipeIngredientForm.recipeIngredientAmount = form.get("recipeIngredientAmount" + recipeIngredientIndex);
            recipeIngredientForm.unitMeasure = form.get("unitMeasure" + recipeIngredientIndex);
            recipeIngredientForm.ingredientNote = form.get("ingredientNote" + recipeIngredientIndex);
            recipeIngredientForms.add(recipeIngredientForm);

            recipeIngredientIndex++;
        }


        String action = form.get("Action");

        if ("Save".equals(action))
        {
            boolean valid = true;

            if (recipeForm.recipeName == null || recipeForm.recipeName.length() < 3 || recipeForm.recipeName.length() > 100)
            {
                valid = false;
                errorMessages.add("Recipe name must be between " + Recipe.RECIPE_NAME_MIN_LENGTH + " and " + Recipe.RECIPE_NAME_MAX_LENGTH + " characters");
            }

            if (!NumberValidator.isValid(recipeForm.difficultyRatingId, Recipe.DIFFICULTY_RATING_MIN, Recipe.DIFFICULTY_RATING_MAX))
            {
                valid = false;
                errorMessages.add("Difficulty rating must be between " + Recipe.DIFFICULTY_RATING_MIN + " and " + Recipe.DIFFICULTY_RATING_MAX);

            }

            if (valid)
            {
                Recipe recipe = new Recipe();

                //Set
                recipe.setFoodArtistId(Integer.parseInt(session().get("foodArtistId")));
                recipe.setRecipeName(recipeForm.recipeName);
                recipe.setTimeCook(Integer.parseInt(recipeForm.timeCook));
                recipe.setTimePrep(Integer.parseInt(recipeForm.timePrep));
                recipe.setTotalTime(Integer.parseInt(recipeForm.totalTime));
                recipe.setServes(Integer.parseInt(recipeForm.serves));
                recipe.setInstructions(recipeForm.instructions);
                recipe.setSource(recipeForm.source);
                recipe.setDifficultyRatingId(Integer.parseInt(recipeForm.difficultyRatingId));

                jpaApi.em().persist(recipe);

                for (RecipeIngredientForm recipeIngredientForm : recipeIngredientForms)
                {
                    RecipeIngredient recipeIngredient = new RecipeIngredient();

                    recipeIngredient.setRecipeId(recipe.getRecipeId());
                    recipeIngredient.setIngredientId(Integer.parseInt(recipeIngredientForm.ingredientId));
                    recipeIngredient.setRecipeIngredientAmount(recipeIngredientForm.recipeIngredientAmount);
                    recipeIngredient.setUnitMeasure(recipeIngredientForm.unitMeasure);
                    recipeIngredient.setIngredientNote(recipeIngredientForm.ingredientNote);

                    if (!recipeIngredientForm.ingredientId.equals("None"))
                    {
                        jpaApi.em().persist(recipeIngredient);
                    }
                }

                result = redirect(routes.RecipeController.getRecipes());
            } else
            {
                result = ok(views.html.newrecipe.render(recipeForm, errorMessages, ingredients, recipeIngredientForms));
            }
        }
        else
        {
            RecipeIngredientForm recipeIngredientForm = new RecipeIngredientForm(recipeIngredientIndex);
            recipeIngredientForms.add(recipeIngredientForm);

            result = ok(views.html.newrecipe.render(recipeForm, errorMessages, ingredients, recipeIngredientForms));

        }

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
        int difficultyRatingId = Integer.parseInt(form.get("difficultyRatingId"));

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
        recipe.setDifficultyRatingId(difficultyRatingId);

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

        return redirect(routes.RecipeController.getRecipes());
    }


    @Transactional(readOnly = true)
    public Result getPicture(Integer id)
    {

        Recipe recipe = (Recipe)jpaApi.em()
                .createQuery("SELECT r FROM Recipe r where recipeId = :id").setParameter("id", id).getSingleResult();

       return ok(recipe.getPhoto()).as("image/jpg");


    }




}
