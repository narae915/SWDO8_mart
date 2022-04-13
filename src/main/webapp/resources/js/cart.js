let basket = {
    totalCount: 0, 
    totalPrice: 0,
    //재계산
    reCalc: function(){
        this.totalCount = 0;
        this.totalPrice = 0;
        // p_num 클래스는 모두 배열로 가져오며, 밑 함수를 반복작업함. 
        document.querySelectorAll(".p_num").forEach(function (item) {
        	// p_num의 부모태그.부모태그.부모태그.형제태그(요소만).그 중 첫번째.그 중 첫번째(=체크박스)가 체크되어있다면 
            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
                // p_num의 값인 수량을 숫자로 변환, count 변수에 넣음.
                var count = parseInt(item.getAttribute('value'));
                
                // 이 반복된 count를 모두 totalCount에 더함.
                this.totalCount += count;
                // p_num의 부모태그.부모태그.형제태그(요소).그 중 첫번째(=가격)의 값을 가져와 price 변수에 넣음.
                var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
                // 각각 수량과 값을 곱해서 totalPrice에 더함
                this.totalPrice += count * price;
            }
        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this가 객체리터럴을 가리키도록 함. - thisArg
    },
    //화면 업데이트
    updateUI: function () {
        document.querySelector('#sum_p_num').textContent = '총 ' + this.totalCount.formatNumber() + '개';
        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';

		// 합계 히든에 넣음
        $("#totalPrice").attr('value',this.totalPrice);
    },
    //개별 수량 변경
    changePNum: function (pos) {
    	// p_num숫자를 name으로 하는 것을 가져와 item에 넣음.
        // var item = document.querySelector('input[name=p_num'+pos+']');
        var item = document.querySelector('#p_num'+pos);
        
        // 이 item의 값을 숫자 변환하여 p_num이라 칭함.
        var p_num = parseInt(item.getAttribute('value'));
        
        // 이벤트(클릭)이 발생한 대상을 얻어와, up 클래스인지 확인한다. true일 경우, p_num에 1을 추가한다.
        // 이를 newval 변수에 입력한다.
        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
        
        // 이 newval이 1보다 작거나, 99보다 클 시는 작동하지 않도록 한다.
        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

		// item의 value속성에 newval을 넣는다.
        item.setAttribute('value', newval);
        item.value = newval;
		
		// item의 부모.부모.형제.첫번째(=가격)의 값을 가져와 price 변수에 저장
        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
        
        // item의 부모.부모.다음 형제의 내용을 조절된 수량과 가격을 곱한 값으로 한다. 즉, 변동된 가격
        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
        
        //AJAX 업데이트 전송

        //전송 처리 결과가 성공이면    
        // totalPrice: 체크표시에 따라 변하는 값
        this.reCalc();
        // 화면 업데이트
        this.updateUI();
    },
    checkItem: function () {
        this.reCalc();
        this.updateUI();
    }
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function(){
    if(this==0) return 0;
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    return nstr;
};

// 장바구니 삭제
function cartCancel() {
	$.ajax({
		url: "/order/cartCancel",
		type: "post",
		data: {
			cartNum: $('#hiddenNum').val()
		},
		success: function(res) {
			exitAlert();
			$("#footer-modal-content").prepend("삭제되었습니다.");
			showModalAlert();
			setTimeout(function() {
				location.reload();
			}, 3000);				
		}
	});
}

// 체크된 값이 없는지 확인.
$('#purchase').click(function () {

	var purchaseNum = [];
	var purchaseAmount = [];
	
	$("input[name=buy]:checked").each(function() {
		purchaseNum.push($(this).val());
	});
	
	// 체크 확인
	if(purchaseNum == "") {
		exitAlert();
		$("#footer-modal-content").prepend("선택된 항목이 없습니다.");
		showModalAlert()
		
		return false;
	}
	
	document.querySelectorAll(".p_num").forEach(function (item) {
        if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked != true){
        	// item.attr('value',-1);
        	item.setAttribute('value', -1);
        	// purchaseAmount.push(item.value);
        }
        
	});
	
});