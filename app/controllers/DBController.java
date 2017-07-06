package controllers;

import models.Recipe;
import play.db.jpa.Transactional;
import play.mvc.Result;

import java.util.List;

import static play.mvc.Results.unauthorized;

public class DBController
{
    @Transactional(readOnly = true)
    public Result getRecipes()
    {
        Result result = unauthorized("No soup for you!");

        String loggedIn = session().get("LoggedIn");
        if (loggedIn != null && loggedIn.equals("true"))
        {
            List<Recipe> recipes =
                    jpaApi.em().
                            createQuery("SELECT e FROM Employee e ORDER BY lastname, firstname", Employee.class).getResultList();

            result = ok(views.html.employees.render(employees));
        }
        return result;
    }


}
