package models;


import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class FoordArtistId
{
    @Id
    private Integer foodArtistId;

    private byte[] password;
    private byte[] salt;


    public Integer getFoodArtistId()
    {
        return foodArtistId;
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
