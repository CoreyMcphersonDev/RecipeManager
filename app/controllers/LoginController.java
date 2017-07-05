package controllers;

import play.data.DynamicForm;
import play.data.FormFactory;
import play.mvc.Controller;
import play.mvc.Result;

import javax.inject.Inject;

/**
 * Created by corey on 7/3/2017.
 */
public class LoginController extends Controller
{
    public class LoginController extends Controller
    {
        FormFactory formFactory;

        @Inject
        public LoginController(FormFactory formFactory)
        {
            this.formFactory = formFactory;
        }

        public Result getLogin()
        {
            return  ok(views.html.login.render());
        }

        public Result login()
        {
            Result result = unauthorized("Intruder Alert");

            DynamicForm form = formFactory.form().bindFromRequest();
            String password = form.get("password");

            if (password.equals("ENTERCASESENSITIVEPASSWORDHERE"))
            {
                result = redirect(routes.CONTROLLER.getYOUWANTTOGETALISTEOFRECIPESANDSHOWTHEM());

            }

            return result;

        }
    }
}
