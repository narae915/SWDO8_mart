$('#submit-btn').click(function() {
    	
	var amount = $('#itemAmount').val();
	var numChk = /^[0-9]*$/;
	var price = $('#price').val();
	
	// 유효성 검사: 수량
	if(!numChk.test(amount)){
		exitAlert();
		$("#footer-modal-content").prepend("수량을 확인해주세요.");
		showModalAlert();
		return false;
		
	} else if(amount.length >3){
		exitAlert();
   		$("#footer-modal-content").prepend("수량을 1000 미만으로 등록해주세요.");
   		showModalAlert();

   		return false;
	}
		
	// 유효성 검사: 가격
	if(!numChk.test(price)){
		exitAlert();
		$("#footer-modal-content").prepend("가격을 확인해주세요.");
		showModalAlert();
		
		return false;
	} else if(price.length >6){
		exitAlert();
		$("#footer-modal-content").prepend("가격을 100만원 미만으로 등록해주세요.");
		showModalAlert();
		
		return false;
	}
});