function myalert(message,dom){
	$("#"+dom).append('<div class="alert alert-info my-alert">'+
			message+
			'</div>');
	setTimeout("$('.my-alert').remove()",3000);
	
}


function showImg(url) {

    var frameid = 'frameimg' + Math.random();

    console.debug(frameid);

    console.debug(url);

    window.img = '<img id="img" style="width:50%" src=\'' + url + '?' + Math.random() + '\' /><script>window.onload = function() { parent.document.getElementById(\'' + frameid + '\').height = document.getElementById(\'img\').height+\'px\'; }<' + '/script>';
    document.write('<iframe id="' + frameid + '" src="javascript:parent.img;" frameBorder="0" scrolling="no" width="50%"></iframe>');

}