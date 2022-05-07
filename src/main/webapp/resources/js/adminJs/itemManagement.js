	// 상품 삭제
	function deValueChk() {
		var cancelNum = [];
		
		$("input[name=itemChk]:checked").each(function() {
			cancelNum.push($(this).val());
		});
		
		var allData = {"cancelNumArray": cancelNum};
		
		if(cancelNum == "") { // 체크박스가 체크되어있지 않은 경우 경고창을 띄우며 삭제를 진행하지 않음.
			exitAlert();
			$("#footer-modal-content").prepend("선택된 항목이 없습니다.");
			showModalAlert()
			
			return false;
		} else {
			$.ajax({
				url: "/admin/itemDelete",
				data: allData,
				success: function(res) {
					if(res == "success") {
						exitAlert();
						$("#footer-modal-content").prepend("삭제되었습니다.")
						showModalAlert();
						setTimeout(function() {
	  						location.reload();
	  					}, 2000);
					}
				} 
			});
				
			return true;	
		}
	}
	
	// 상품 수정
	function itemUpdate(){
		var updateNum = [];
		var checked = $("input[name=itemChk]:checked");
		checked.each(function() {
			updateNum.push($(this).val());
		});
		
		if(updateNum == "") { // 체크박스가 체크되어있지 않은 경우 경고창을 띄우며 수정을 진행하지 않음.
			exitAlert();
			$("#footer-modal-content").prepend("선택된 항목이 없습니다.")
			showModalAlert();
			
			return false;
		} 
	}