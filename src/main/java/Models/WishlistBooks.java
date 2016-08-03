package Models;

import net.jextra.fauxjo.FauxjoField;
import net.jextra.fauxjo.FauxjoImpl;
import net.jextra.fauxjo.FauxjoPrimaryKey;

import java.util.UUID;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class WishlistBooks extends FauxjoImpl {

    @FauxjoPrimaryKey
    @FauxjoField("wishlistid")
    private UUID wishlistId;

    @FauxjoField("bookid")
    private UUID bookId;

    @FauxjoField("userid")
    private UUID userId;

    public WishlistBooks()
    {
        wishlistId = UUID.randomUUID();
    }

    public UUID getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(UUID wishlistId) {
        this.wishlistId = wishlistId;
    }

    public UUID getBookId() {
        return bookId;
    }

    public void setBookId(UUID bookId) {
        this.bookId = bookId;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    @Override
    public String toString()
    {
        return String.format("%s wishlistId[%s] bookId[%s] userId[%s]", getClass().getSimpleName(), wishlistId, bookId, userId);
    }
}
