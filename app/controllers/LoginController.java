package controllers;

import models.FoodArtist;
import models.FoodArtistId;
import models.Password;
import play.Logger;
import play.data.DynamicForm;
import play.data.FormFactory;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;
import sun.rmi.runtime.Log;

import javax.inject.Inject;
import javax.persistence.Id;
import javax.persistence.Query;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;


public class LoginController extends BaseController
{
       private FormFactory formFactory;
       private JPAApi jpaApi;

        @Inject
        public LoginController(FormFactory formFactory, JPAApi jpaApi)
        {
            this.formFactory = formFactory;
            this.jpaApi = jpaApi;
        }

        public Result getLogin()
        {
            return  ok(views.html.login.render());
        }

        @Transactional(readOnly = true)
        public Result login()
        {
            Result result = unauthorized("NO SOUP FOR YOU!");

            DynamicForm form = formFactory.form().bindFromRequest();
            String username = form.get("username");
            String password = form.get("password");

            String sql = "SELECT foodArtistId, foodArtistUserName, firstName, lastName, password, salt FROM foodArtist WHERE foodArtistUserName = :username";


            //SHOW ME WHAT YOU GOT!
            Logger.debug("Login SQL: " + sql);
            Logger.debug(username);

            @SuppressWarnings("unchecked")
            List<FoodArtistId> foodArtistIds = jpaApi.em().createNativeQuery(sql, FoodArtistId.class).
                    setParameter("username", username).
                    getResultList();

            if (foodArtistIds.size() == 1)
            {
                Logger.debug("got user" + username);
                FoodArtistId foodArtistId = foodArtistIds.get(0);
                byte[] hashedPassword = Password.hashPassword(password.toCharArray(), foodArtistId.getSalt());
                byte[] dbPassword = foodArtistId.getPassword();

                if (Arrays.equals(hashedPassword, dbPassword))
                {
                    login(username, foodArtistId.getFoodArtistId());
                    result = redirect(routes.RecipeController.getRecipes());
                }
            }
                return result;
        }
    }

