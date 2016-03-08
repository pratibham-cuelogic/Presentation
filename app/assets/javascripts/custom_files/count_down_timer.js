
$(function(){
    $("#qs_0").show();
    $('#s_timer').countdowntimer({
        minutes :2,
        //seconds :5,
        size : "lg",
        timeUp : timeisUp
    });
    function timeisUp() {
        $.ajax({
            url: '/timeis-up',
            method: 'POST',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            success: function(data) {
                alert('Your Times Up Thank You!')
                window.location.replace('/ThankYou')
            }
        })

    }
});


function next_question(index){
    $(".questions").hide();
    $("#qs_"+index).show();
    var rad_index = index - 1
    var set = document.getElementsByName("answers_"+rad_index)[0].value
    $.ajax({
        url: '/submit-answer',
        method: 'POST',
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        },
        data: {set: set, question_number: index}
    })

}
