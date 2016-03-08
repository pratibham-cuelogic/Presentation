
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

function view_start_analytics(param1){
    var background = {
                type: 'linearGradient',
                x0: 0,
                y0: 0,
                x1: 0,
                y1: 1,
                colorStops: [{ offset: 0, color: 'transparent' },
                             { offset: 1, color: 'transparent' }]
            };

            $('#jqChart').jqChart({
                title: { text: 'Cue Hunt Analytics' },
                legend: { title: 'Technology' },
                border: { strokeStyle: 'transparent' },
                background: background,
                animation: { duration: 1 },
                shadows: {
                    enabled: true
                },
                series: [
                    {
                        type: param1,
                        fillStyles: ['#418CF0', '#FCB441', '#E0400A', '#056492', '#BFBFBF', '#1A3B69', '#FFE382'],
                        labels: {
                            stringFormat: 'Score',
                            valueType: 'percentage',
                            font: '15px sans-serif',
                            fillStyle: '#777'
                        },
                        explodedRadius: 10,
                        explodedSlices: [5],
                        data: [['ROR', 65], ['PHP', 58], ['Javascript', 67],
                               ['Testing', 60], ['.Net', 65], ['UI', 75]]
                    }
                ]
            });

            $('#jqChart').bind('tooltipFormat', function (e, data) {
                //  var percentage = data.series.getPercentage(data.value);
                // percentage = data.chart.stringFormat(percentage, '%.2f%%');

                // return '<b>' + data.dataItem[0] + '</b><br />' +
                //        data.value + ' (' + percentage + ')';
            });
}

arrNum= Array('linearGradient','pie','column','spline')

function shuffle(array) {
    var tmp, current, top = array.length;
    if(top) while(--top) {
        current = Math.floor(Math.random() * (top + 1));
        tmp = array[current];
        array[current] = array[top];
        array[top] = tmp;
    }
    return array;
}

$(document).ready(function(){

    setInterval(function(){ 
        var array_num = shuffle(arrNum);
        var param1, param2;
        for(var i=0; i<arrNum.length; i++){
            param1 = arrNum[i];
        }
        view_start_analytics(param1,param2);
    }, 4000);

view_start_analytics('linearGradient');

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

    $(".existing-candidate").click(function(){
        $(".input-group.exiting-email-input").toggleClass('display-block');
    });
    $(".new-user").click(function(){
        $(this).hide();
        $('.exiting-email-input').removeClass('display-block');
        $(".existing-candidate").hide();
        $(".new-candidate-registration").toggleClass('display-block')
    });

    $(".send-invite").click(function(){
        $(".existing-candidate").show();
        $(".new-user").show();
        $(".new-candidate-registration").removeClass('display-block');
    });



});



