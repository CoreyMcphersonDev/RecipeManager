package controllers;


import models.FoodArtist;
import models.FoodArtistForm;
import models.Password;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Result;

import java.util.ArrayList;
import java.util.List;

public class FoodArtistController extends BaseController
{
    private  FormFactory formFactory;
    private  JPAApi jpaApi;

    public Result addFoodArtist()
    {
        List<String> errorMessages = new ArrayList<>();

        return ok(views.html.newfoodartist.render(new FoodArtistForm(), errorMessages));
    }


    @Transactional
    public Result addNewFoodArtist() throws Exception
    {
        Result result;
        List<String> errorMessages = new ArrayList<>();

        DynamicForm form = formFactory.form().bindFromRequest();

        FoodArtistForm foodArtistForm = new FoodArtistForm();

        foodArtistForm.userName = form.get("username");
        foodArtistForm.firstName = form.get("firstname");
        foodArtistForm.lastName = form.get("lastname");
        foodArtistForm.password = form.get("password");

        boolean valid = true;

        if (foodArtistForm.userName.length() > FoodArtist.USER_NAME_MAX_LENGTH)
        {
            valid = false;
            errorMessages.add("User Name must be " + FoodArtist.USER_NAME_MAX_LENGTH + " characters or less");
        }
        if (foodArtistForm.firstName.length() > FoodArtist.FIRST_NAME_MAX_LENGTH)
        {
            valid = false;
            errorMessages.add("First Name must be " + FoodArtist.FIRST_NAME_MAX_LENGTH + " characters or less");
        }
        if (foodArtistForm.lastName.length() > FoodArtist.LAST_NAME_MAX_LENGTH)
        {
            valid = false;
            errorMessages.add("Last Name must be " + FoodArtist.LAST_NAME_MAX_LENGTH + " characters or less");
        }

        if (valid)
        {
            FoodArtist foodArtist = new FoodArtist();

            byte[] salt = Password.getNewSalt();
            byte[] hashedPassword = Password.hashPassword(foodArtistForm.password.toCharArray(), salt);

            foodArtist.setUserName(foodArtistForm.userName);
            foodArtist.setFirstName(foodArtistForm.firstName);
            foodArtist.setLastName(foodArtistForm.lastName);
            foodArtist.setPassword(hashedPassword);
            foodArtist.setSalt(salt);

            jpaApi.em().persist(foodArtist);

            result = redirect(routes.RecipeController.getRecipes());
        }
        else
        {
            result = ok(views.html.newfoodartist.render(foodArtistForm, errorMessages));
        }

        return result;
    }
}
