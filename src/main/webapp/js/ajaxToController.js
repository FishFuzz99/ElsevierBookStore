/**
 * Created by GRAY1 on 7/28/2016.
 */

function addBooksToCart()
{
    var ids = $('.hiddenIDs').map(function(){
        return $(this).text();
    }).get();


    $.ajax({
        url: 'addToCart',
        type: 'post',
        data: {
            ids: ids.toString()
        },
        dataType: 'json',
        success: function (data) {
            alert('It worked!');
            $('.addBookSuccess').fadeIn(400).delay(3000).fadeOut(400);
        }
    });

    $('.addBookSuccess').fadeIn(400).delay(3000).fadeOut(400);
}

function addToCart(id)
{

    $.ajax({
        url: 'addToCart',
        type: 'post',
        data: {
            ids: id.toString()
        },
        dataType: 'json',
        success: function (data) {
            alert('It worked!');
            $('.addBookSuccess').fadeIn(400).delay(3000).fadeOut(400);
        }
    });

    $('.addBookSuccess').fadeIn(400).delay(3000).fadeOut(400);
}

function addToWishlist(id)
{
    $.ajax({
        url: 'addToWishlist',
        type: 'post',
        data: {
            ids: id.toString()
        },
        dataType: 'json',
        success: function (data) {
            alert('It worked!');
            $('.addBookSuccess').fadeIn(400).delay(3000).fadeOut(400);
        }
    });

    $('.addBookSuccess').fadeIn(400).delay(3000).fadeOut(400);
}