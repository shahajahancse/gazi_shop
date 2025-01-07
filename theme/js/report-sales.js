// due print
function print_due(customer_id) {
  var from_date = document.getElementById("from_date").value.trim();
  var to_date=document.getElementById("to_date").value.trim();
  if(from_date == "")
  {
    toastr["warning"]("Select From Date!");
    document.getElementById("from_date").focus();
    return;
  }

  if(to_date == "")
  {
    toastr["warning"]("Select To Date!");
    document.getElementById("to_date").focus();
    return;
  }

  $.post("single_customer_due",{customer_id:customer_id,from_date:from_date,to_date:to_date},function(result){
    letter_1 = window.open('', '_blank', 'menubar=1,resizable=1,scrollbars=1,width=1600,height=800');
    letter_1.document.write(result);
    letter_1.document.close(); // Important to close the stream before printing
  });
}

// due search list
function sales_due() {
  var from_date = document.getElementById("from_date").value.trim();
  var to_date=document.getElementById("to_date").value.trim();
  var customer_id=document.getElementById("customer_id").value.trim();
  if(from_date == "")
  {
    toastr["warning"]("Select From Date!");
    document.getElementById("from_date").focus();
    return;
  }

  if(to_date == "")
  {
    toastr["warning"]("Select To Date!");
    document.getElementById("to_date").focus();
    return;
  }

  if (customer_id == "") {
    var view_all = "yes";
  } else {
    var view_all = "no";
  }

  $.post("show_sales_due",{customer_id:customer_id,view_all:view_all,from_date:from_date,to_date:to_date},function(result){
    $("#tbodyid").empty().append(result);
    $(".overlay").remove();
  });
}


$("#view,#view_all").click(function(){
    var from_date=document.getElementById("from_date").value.trim();
    var to_date=document.getElementById("to_date").value.trim();
    var customer_id=document.getElementById("customer_id").value.trim();
  	if(from_date == "")
    {
        toastr["warning"]("Select From Date!");
        document.getElementById("from_date").focus();
        return;
    }

  	if(to_date == "")
    {
        toastr["warning"]("Select To Date!");
        document.getElementById("to_date").focus();
        return;
    }

    if(this.id=="view_all"){
      var view_all='yes';
    }else{
      var view_all='no';
    }

    $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
    $.post("show_sales_report",{customer_id:customer_id,view_all:view_all,from_date:from_date,to_date:to_date},function(result){
      setTimeout(function() {
        $("#tbodyid").empty().append(result);
        $(".overlay").remove();
      }, 0);
    });
});



