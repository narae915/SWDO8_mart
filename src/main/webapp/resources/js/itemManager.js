	// 상품 삭제
	function deValueChk() {
		var cancelNum = [];
		
		$("input[name=itemChk]:checked").each(function() {
			cancelNum.push($(this).val());
		});
		
		var allData = {"cancelNumArray": cancelNum};
		
		if(cancelNum == "") { // 체크박스가 체크되어있지 않은 경우 경고창을 띄우며 삭제를 진행하지 않음.
			alert("선택된 항목이 없습니다.");
			
			return false;
		} else {
			$.ajax({
				url: "/admin/itemDelete",
				data: allData,
				success: function(res) {
					if(res == "success") {
						alert("삭제되었습니다.");
						
						location.href = "/admin/itemManagement";
					}
				} 
			});
				
			return true;	
		}
	}
	
	/*
	
	// 상품 수정
	function upValueChk() {
		
		var updateNum = [];
		var checked = $("input[name=itemChk]:checked");
		checked.each(function() {
			updateNum.push($(this).val());
		});
		
		var allData = {"updateNumArray": updateNum};

		if(updateNum.length >= 2){
			alert("한 개만 선택해주세요.");
			
			return false;
		}
		
		if(updateNum == "") { // 체크박스가 체크되어있지 않은 경우 경고창을 띄우며 수정을 진행하지 않음.
			alert("선택된 항목이 없습니다.");
			
			return false;
		} else {
			$.ajax({
				url: "/admin/itemUpdate",
				type: "post",
				data: allData,
				success: function(url){
					location.href="/admin/itemUpdate";
					
				}
			});
		}
	}
	*/
