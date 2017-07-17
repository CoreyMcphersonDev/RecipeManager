package controllers;


import play.data.FormFactory;
import play.db.jpa.JPAApi;

public class RecipeIngredientController extends BaseController
{
    private final FormFactory formFactory;
    private final JPAApi jpaApi;

    public RecipeIngredientController(FormFactory formFactory, JPAApi jpaApi)
    {
        this.formFactory = formFactory;
        this.jpaApi = jpaApi;
    }





}
