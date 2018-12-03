$(function(){
	
	$('.menu').on('click',function(){
		$('#sidebar').css('right',0);
		$('.mask').fadeIn();
	})
	$('.mask').on('click',function(){
		$('#sidebar').css('right',- $('#sidebar').width());
		$('.mask').fadeOut();
	})
	
})

$(function(){
	$('#all').on('click',function(){
		if(this.checked)
		{
			$('input[name="sub"]').each(function(){
				$(this).prop("checked",true);
			});
		}
		else
		{
			$('input[name="sub"]').each(function(){
				$(this).prop("checked",false);

			});

		}

	});
		
})
 
$(function(){
	$('a[href="download.html"]').on('click',function(){
		$.ajax({
			url:''
		})
	})
}) 