function doLike(pid,uid){
    console.log(pid + " " + uid);
    const d = {
        uid:uid,
        pid:pid,
        operation:'like'
    };
    $.ajax({
        url:"LikeServlet",
        data:d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim() === 'true'){
                let c = $('.like-counter').html();
                c++;
                $('.like-counter').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
        }
    });
};
function doComment(pid,uid){
    console.log(pid + " " + uid);
    const d = {
        uid:uid,
        pid:pid,
        operation:'comment'
    };
    $.ajax({
        url:"CommentServlet",
        data:d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim() === 'done'){
                let c = $('.cmt-counter').html();
                c++;
                $('.cmt-counter').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
        }
    });
};