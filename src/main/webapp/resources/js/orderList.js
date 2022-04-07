// 주문 취소
$('#cancelButton').click(function() {

	var cancelNum = [];
	
	$("input[name=orderNum]:checked").each(function() {
		cancelNum.push($(this).val());
	});
	
	var allData = {"cancelNumArray": cancelNum};
	
	if(cancelNum == "") { // 체크박스가 체크되어있지 않은 경우 경고창을 띄우며 취소를 진행하지 않음.
		exitAlert();
		$("#footer-modal-content").prepend("선택된 항목이 없습니다.");
		showModalAlert()
		
		return false;
	
	} else { // 체크박스가 체크된 경우 확인 절차를 진행함.
		confirmModal();	
		$("#footer-modal-content").prepend("정말 취소하시겠습니까?");
		showModalAlert();
		
		$('#yes-button').click(function() {
			$.ajax({
				url: "/order/orderCancel",
				type: "post",
				data: allData,
				success: function(res) {
					if(res == 'success') {
						exitAlert();
	  					$("#footer-modal-content").prepend("취소되셨습니다.");
	  					showModalAlert();
	  					setTimeout(function() {
	  						location.reload();
	  					}, 3000);
	  					
					}
					
				}
			});
			
		});
		
		$('#no-button').click(function() {
			$("#footer-modal").fadeOut();
			return false;
		});
		
	}
})


//검색어 유효성 검사
function searchChk() {
	var searchWord = $.trim($("input[name=searchWord]").val());
		var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20a-zA-Z0-9])/i;
		if (kor_check.test(searchWord)){
			exitAlert();
			$("#footer-modal-content").prepend("한글, 영어, 숫자만 입력 가능합니다.");
			showModalAlert()
			
			return false
		} else {
			return true;
		}
	
}