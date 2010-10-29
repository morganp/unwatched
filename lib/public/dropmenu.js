
/* http://designreviver.com/tutorials/jquery-css-example-dropdown-menu/ */

   $(document).ready(function(){
		$('#cssdropdown li.headlink').hover(
			function() { $('ul', this).css('display', 'block'); },
			function() { $('ul', this).css('display', 'none'); });
    });	

