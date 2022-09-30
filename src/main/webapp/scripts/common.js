var cfm = function(e)
{
	//e.preventDefault();
	swal({
		  title: "你确定要继续吗?",
		  text: "继续操作有一定的风险性，请谨慎操作!",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "是的，继续!",
		  closeOnConfirm: false
		},
		function(){
		  location.href = $(e).attr("data-href");
		});
	}