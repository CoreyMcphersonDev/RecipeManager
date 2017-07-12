package models;


import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class FoodArtistId
{
    @Id
    private int foodArtistId;

    private String foodArtistUserName;

    private byte[] password;

    private byte[] salt;

    public int getFoodArtistId()
    {
        return foodArtistId;
    }

    public String getFoodArtistUserName()
    {
        return foodArtistUserName;
    }

    public byte[] getPassword()
    {
        return password;
    }

    public byte[] getSalt()
    {
        return salt;
    }
}
