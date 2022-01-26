$(document).ready(function () {
    $(document).click(function (event) {
        var clickover = $(event.target);
        var _opened = $(".navbar-collapse").hasClass("show");
        if (_opened === true && !clickover.hasClass("navbar-toggler")) {
            $(".navbar-toggler").click();
        }
    });
});

$("#dashBoard , #dashBoard1").click(function(){
    $("#dashBoardTable").show();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#favouriteProsTable").hide();
    $("#notificationTable").hide();
});
$("#serviceSchedule , #serviceSchedule1").click(function(){
    $("#dashBoardTable").hide();
    $("#serviceScheduleTable").show();
    $("#serviceHistoryTable").hide();
    $("#favouriteProsTable").hide();
    $("#notificationTable").hide();
});
$("#serviceHistory , #serviceHistory1").click(function(){
    $("#dashBoardTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").show();
    $("#favouriteProsTable").hide();
    $("#notificationTable").hide();
});
$("#favouritePros , #favouritePros1").click(function(){
    $("#dashBoardTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#favouriteProsTable").show();
    $("#notificationTable").hide();
});
$("#notification , #notification1").click(function(){
    $("#dashBoardTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#favouriteProsTable").hide();
    $("#notificationTable").show();
});
