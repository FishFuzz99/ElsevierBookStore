package Models;

/**
 * Created by GRAY1 on 7/15/2016.
 */
public enum BookFormat {
    PHYSICAL("Physical"),
    EBOOK("eBook");

    private String value;

    BookFormat(final String value)
    {
        this.value = value;
    }

    public String getValue()
    {
        return value;
    }

    @Override
    public String toString()
    {
        return this.getValue();
    }


}
