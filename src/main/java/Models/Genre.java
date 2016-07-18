package Models;

/**
 * Created by GRAY1 on 7/14/2016.
 */
public enum Genre {
    SCIENCE_FICTION("Science Fiction"),
    SATIRE("Satire"),
    ACTION_AND_ADVENTURE("Action and Adventure"),
    DRAMA("Drama"),
    ROMANCE("Romance"),
    MYSTERY("Mystery"),
    HORROR("Horror"),
    SELF_HELP("Self help"),
    HEALTH("Health"),
    GUIDE("Guide"),
    TRAVEL("Travel"),
    CHILDRENS("Children's"),
    RELIGION("Religion"),
    SPIRITUALITY_AND_NEW_AGE("Spirituality & New Age"),
    SCIENCE("Science"),
    HISTORY("History"),
    MATH("Math"),
    ANTHOLOGY("Anthology"),
    POETRY("Poetry"),
    ENCYCLOPEDIAS("Encyclopedias"),
    DICTIONARIES("Dictionaries"),
    COMICS("Comics"),
    ART("Art"),
    COOKBOOKS("Cookbooks"),
    DIARIES("Diaries"),
    JOURNALS("Journals"),
    PrAYER_BOOKS("Prayer books"),
    SERIES("Series"),
    TRILOGY("Trilogy"),
    BIOGRAPHIES("Biographies"),
    AUTOBIOGRAPHIES("Autobiographies"),
    FANTASY("Fantasy");

    private String value;

    Genre(final String value)
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
