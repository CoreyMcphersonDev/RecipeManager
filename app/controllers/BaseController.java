package controllers;

import play.mvc.Controller;


public class BaseController extends Controller
{
    private static String usernameToken = "username";
    private static String foodArtistIdToken = "foodArtistId";
    private static String recipeIdToken = "recipeId";


    public void login(String userName, int foodArtistId)
    {
        session().put(usernameToken, userName);
        session().put(foodArtistIdToken, ""+foodArtistId);

    }

    public boolean loggedIn()
    {
        String userName = session().get(usernameToken);

        return (userName != null && userName.length() > 0);
    }

    public void logout()
    {
        session().remove(usernameToken);
    }


    public int getFoodArtistId()
    {
        int foodArtistId = Integer.parseInt(session().get(foodArtistIdToken));

        return foodArtistId;
    }

}