function openWindow(url)
{
	window.open(url,"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=800, height=200")
}

function openWin(url) { 
     
                               //��ҳ���ƣ���Ϊ��; 
    var iWidth=720;                          //�������ڵĿ��; 
    var iHeight=600;                         //�������ڵĸ߶�; 
    //��ô��ڵĴ�ֱλ�� 
    var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
    //��ô��ڵ�ˮƽλ�� 
    var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
    window.open(url, "_blank", 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
   // window.open("AddScfj.aspx", "newWindows", 'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no'); 
}

$(document).ready(function(){
	var css = $("<link href='http://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css'/>");
	var js = $("<script src='//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js'></script>");
	css.appendTo($("body"));	
	js.appendTo($("body"));
	$('table').DataTable();
})