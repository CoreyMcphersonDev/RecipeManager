package models;


import play.data.validation.Constraints;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.Constraint;


@Entity
@Table(name = "FoodArtist")
public class FoodArtist
{
    public static final int USER_NAME_MAX_LENGTH = 30;
    public static final int USER_NAME_MIN_LENGTH = 4;
    public static final int FIRST_NAME_MAX_LENGTH = 15;
    public static final int LAST_NAME_MAX_LENGTH = 30;

    @Id
    @Column(name = "foodArtistId")
    private int foodartistId;

    @Column(name = "foodArtistUserName")
    private String userName;

    @Column(name = "firstName")
    @Constraints.MinLength(1)
    @Constraints.MaxLength(10)
    private String firstName;

    @Column(name = "lastName")
    @Constraints.MinLength(1)
    private String lastName;

    @Column(name = "password")
    private byte[] password;

    @Column(name = "salt")
    private byte[] salt;

    public int getFoodartistId()
    {
        return foodartistId;
    }

    public void setFoodartistId(int foodartistId)
    {
        this.foodartistId = foodartistId;
    }

    public String getfoodArtistUserName()
    {
        return userName;
    }

    public void setfoodArtistUserName(String userName)
    {
        this.userName = userName;
    }

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public String getLastName()
    {
        return lastName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public byte[] getPassword()
    {
        return password;
    }

    public void setPassword(byte[] password)
    {
        this.password = password;
    }

    public byte[] getSalt()
    {
        return salt;
    }

    public void setSalt(byte[] salt)
    {
        this.salt = salt;
    }

}
