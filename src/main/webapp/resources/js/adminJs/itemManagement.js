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
			showModalAlert();
			
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
	
	//세일 추가
	function setUpSale() {
		$("#footer-modal-content").html("");
		$("#footer-modal-content").append("<div><input type='button' class='setup-sale' id='sendSaleInfo' value='전송'> <input type='button' class='setup-sale' id='close' value='창닫기'></div>");
		$("#footer-modal-content").prepend("<input type='text' id='salePercent' placeholder='ex) 30 (% 제외)' onkeyup='inNumber();'>");
		$("#footer-modal-content").prepend("<b>할인율</b>");
		$("#footer-modal-content").prepend("<input type='text' id='saleName' placeholder='ex) 소고기'>");
		$("#footer-modal-content").prepend("<b>세일 설정하고 싶은 상품</b>");
		$("#footer-modal").fadeIn();

		$("#sendSaleInfo").click(function() {
			setSale();
		});
		$("#close").click(function() {
			$("#footer-modal").fadeOut();
		});
	}

	function inNumber() {
		if(event.keyCode>48 || event.keyCode<57) {
			alert("숫자만 입력해주세요.");
		}
	}
	function setSale() {
		$.ajax({
			url: "/admin/saleProduct",
			type: "POST",
			data: {
				salePercent: $("#salePercent").val(),
				saleName: $("#saleName").val()
			},
			success: function(res) {
				if(res == "yes") {
					alert("설정이 완료되었습니다.");
				} else {
					alert("설정에 실패하였습니다. 상품명을 한번 더 확인해 주세요."
					);
				}
				$("#footer-modal").fadeOut();
			},
			error: function(e) {
				console.log(e);
			}
		});
	}