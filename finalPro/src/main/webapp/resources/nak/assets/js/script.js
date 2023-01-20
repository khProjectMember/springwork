function idCheck(id){
	regFrm.idbtncheck.value = "idCheck";
	if(id == ""){
		alert("아이디를 입력하세요");
		regFrm.id.focus();
		return;
	}	
	url = "idCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300, height=200");
}

function inputIdChk(){
	regFrm.idbtncheck.value="idUncheck";
}


function inputCheck(){
	if(regFrm.idbtncheck.value == "idUncheck"){
		alert("아이디 중복체크를 해주세요")
		return;
	}
	
	if(regFrm.id.value == ""){
		alert("아이디를 입력하세요")
		regFrm.id.focus();
		return;
	}
	
	
	if(regFrm.pwd.value == ""){
		alert("비밀번호를 입력하세요");
		regFrm.pwd.focus();
		return;
	}
	
	if(regFrm.repwd.value == ""){
		alert("비밀번호를 한번 더입력하세요");
		regFrm.repwd.focus();
		return;
	}
	if(regFrm.pwd.value != regFrm.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		regFrm.repwd.focus();
		return;
	}
	
	
	if(regFrm.name.value == ""){
		alert("이름을 입력하세요");
		regFrm.name.focus();
		return;
	}
	
	if(regFrm.birthday.value == ""){
		alert("생년월일을 입력하세요");
		regFrm.birthday.focus();
		return;
	}
	
	if(regFrm.email.value == ""){
		alert("이메일을 입력하세요");
		regFrm.email.focus();
		return;
	}
	
	
    if(regFrm.phone.value == ""){
		alert("전화번호를 입력하세요");
		regFrm.phone.focus();
		return;
	}
    
	regFrm.submit();
}

