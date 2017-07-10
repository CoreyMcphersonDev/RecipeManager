package controllers;

import models.FoodArtist;
import models.Password;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;

import javax.inject.Inject;
import java.util.Arrays;
import java.util.List;


public class LoginController extends BaseController
{
        FormFactory formFactory;
        JPAApi jpaApi;

        @Inject
        public LoginController(FormFactory formFactory)
        {
            this.formFactory = formFactory;
        }

        public Result getLogin()
        {
            return  ok(views.html.login.render());
        }

        @Transactional(readOnly = true)
        public Result login()
        {
            Result result = unauthorized("Intruder Alert!");

            DynamicForm form = formFactory.form().bindFromRequest();
            String username = form.get("foodArtistUserName");
            String password = form.get("password");

            String sql = "SELECT foodArtistId, password, salt FROM foodartist WHERE foodArtistId = :foodArtistId";

            @SuppressWarnings("unchecked")
            List<FoodArtist> foodArtistIds = jpaApi.em().
                    createNativeQuery(sql, FoodArtist.class).
                    setParameter("foodArtistUserName", username).
                    getResultList();

            if (foodArtistIds.size() == 1)
            {

                FoodArtist foodArtistId = foodArtistIds.get(0);
                byte[] hashedPassword = Password.hashPassword(password.toCharArray(), foodArtistId.getSalt());
                byte[] dbPassword = foodArtistId.getPassword();

                if (Arrays.equals(hashedPassword, dbPassword))
                {
                    login(username);
                    result = redirect(routes.RecipeController.getRecipes());
                }

            }
                return result;
        }
    }

