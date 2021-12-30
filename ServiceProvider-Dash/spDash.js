$(document).ready(function () {
    $(document).click(function (event) {
        var clickover = $(event.target);
        var _opened = $(".navbar-collapse").hasClass("show");
        if (_opened === true && !clickover.hasClass("navbar-toggler")) {
            $(".navbar-toggler").click();
        }
    });
});
// dashBoard
// newServiceRequestTable
// upcomingService
// serviceSchedule
// serviceHistory
// myRating
// blockCustomer

$("#dashBoard , #dashBoard1").click(function(){
    $("#dashBoardTable").show();
    $("#newServiceRequestTable").hide();
    $("#upcomingServicesTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#myRatingTable").hide();
    $("#blockCustomerTable").hide();
    $("#notificationTable").hide();
});
$("#newServiceRequest , #newServiceRequest1").click(function(){
    $("#dashBoardTable").hide();
    $("#newServiceRequestTable").show();
    $("#upcomingServicesTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#myRatingTable").hide();
    $("#blockCustomerTable").hide();
    $("#notificationTable").hide();
});
$("#upcomingServices , #upcomingServices1").click(function(){
    $("#dashBoardTable").hide();
    $("#newServiceRequestTable").hide();
    $("#upcomingServicesTable").show();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#myRatingTable").hide();
    $("#blockCustomerTable").hide();
    $("#notificationTable").hide();
});
$("#serviceSchedule , #serviceSchedule1").click(function(){
    $("#dashBoardTable").hide();
    $("#newServiceRequestTable").hide();
    $("#upcomingServicesTable").hide();
    $("#serviceScheduleTable").show();
    $("#serviceHistoryTable").hide();
    $("#myRatingTable").hide();
    $("#blockCustomerTable").hide();
    $("#notificationTable").hide();
});
$("#serviceHistory , #serviceHistory1").click(function(){
    $("#dashBoardTable").hide();
    $("#newServiceRequestTable").hide();
    $("#upcomingServicesTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").show();
    $("#myRatingTable").hide();
    $("#blockCustomerTable").hide();
    $("#notificationTable").hide();
});
$("#myRating , #myRating1").click(function(){
    $("#dashBoardTable").hide();
    $("#newServiceRequestTable").hide();
    $("#upcomingServicesTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#myRatingTable").show();
    $("#blockCustomerTable").hide();
    $("#notificationTable").hide();
});
$("#blockCustomer , #blockCustomer1").click(function(){
    $("#dashBoardTable").hide();
    $("#newServiceRequestTable").hide();
    $("#upcomingServicesTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#myRatingTable").hide();
    $("#blockCustomerTable").show();
    $("#notificationTable").hide();
});
$("#notification , #notification1").click(function(){
    $("#dashBoardTable").hide();
    $("#newServiceRequestTable").hide();
    $("#upcomingServicesTable").hide();
    $("#serviceScheduleTable").hide();
    $("#serviceHistoryTable").hide();
    $("#myRatingTable").hide();
    $("#blockCustomerTable").hide();
    $("#notificationTable").show();
});


