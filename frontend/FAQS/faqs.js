$('#forServiceProvider').click(function(){
    $('#accordionCustomer').hide();
    $('#accordionServiceProvider').show();
    $('#forServiceProvider').css('background-color' , '#1d7a8c');
    $('#forCustomer').css('background-color' , '#f6f6f6')
    $('#forServiceProvider').css('color' , '#fff');
    $('#forCustomer').css('color' , '#000')
});


$('#forCustomer').click(function(){
    $('#accordionCustomer').show();
    $('#accordionServiceProvider').hide();
    $('#forCustomer').css('background-color' , '#1d7a8c');
    $('#forServiceProvider').css('background-color' , '#f6f6f6')
    $('#forCustomer').css('color' , '#fff');
    $('#forServiceProvider').css('color' , '#000')
});