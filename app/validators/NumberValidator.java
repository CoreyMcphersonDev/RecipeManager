package validators;

import java.math.BigDecimal;

public class NumberValidator
{
    public static boolean isValid(String value, BigDecimal min, BigDecimal max)
    {
        boolean valid = true;

        try
        {
            BigDecimal testValue = new BigDecimal(value);

            if (testValue.compareTo(min) < 0)
            {
                valid = false;
            }

            if (testValue.compareTo(max) > 0)
            {
                valid = false;
            }
        }
        catch (Exception e)
        {
            valid = false;
        }

        return valid;
    }

    public static boolean isValid(String value, int min, int max)
    {
        boolean valid = true;

        try
        {
            int testValue = new Integer(value);

            if (testValue < min)
            {
                valid = false;
            }

            if (testValue > max)
            {
                valid = false;
            }
        }
        catch (Exception e)
        {
            valid = false;
        }

        return valid;
    }
}
