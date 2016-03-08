
function remove_activate_tab(){
    $(".dashboard").removeClass('activate');
    $(".reports").removeClass('activate');
    $(".que-n-ans").removeClass('activate');
    $(".candidate").removeClass('activate');
    $(".dashboard-menu li").removeClass('active');
}
function toggleChevron(e) {
    $(e.target)
        .prev('.panel-heading')
        .find("i.indicator")
        .toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
}

$(document).ready(function(){
    //
    //$('#datepicker1').datepicker();
    //$('#datepicker2').datepicker();

    $('#accordion').on('hidden.bs.collapse', toggleChevron);
    $('#accordion').on('shown.bs.collapse', toggleChevron);

    $("#dashboard_block").click(function(){
        remove_activate_tab();
        $(this).addClass('active')
        $(".dashboard").addClass('activate');
    });

    $("#report_block").click(function(){
        remove_activate_tab();
        $(this).addClass('active')
        $(".reports").addClass('activate');
    });

    $("#question_block").click(function(){
        remove_activate_tab();
        $(this).addClass('active')
        $(".que-n-ans").addClass('activate');
    });

    $("#candidate_block").click(function(){
        remove_activate_tab();
        $(this).addClass('active')
        $(".candidate").addClass('activate');
    })

    $(".existing-candidate").on('click',function(){
        $(".input-group.exiting-email-input").toggleClass('display-block');
    });
    $(".new-user").on('click',function(){
        $(this).hide();
        $('.exiting-email-input').removeClass('display-block');
        $(".existing-candidate").hide();
        $(".new-candidate-registration").toggleClass('display-block')
    });

    $(".back-invite").click(function(){
        $(".existing-candidate").show();
        $(".new-user").show();
        $(".new-candidate-registration").removeClass('display-block');
    });

    $()


    

});



