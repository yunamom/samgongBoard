/* 게시판 유효성 체크 */
function fn_submit(){
	var f = document.frm;
	if(f.q_title.value.trim().length == ""){
		alert("제목을 입력해주세요.");
		return false;
	}
	if(f.q_con.value.trim().length == "" || f.q_con.value.trim().length < 10){
		alert("내용을 10자 이상으로 작성해주세요.");
		return false;
	}
	f.submit();
}
/* 게시물 삭제 컨펌 */
function fn_boardDelete(q_no){ 
	if(confirm("정말 삭제하시겠습니까?")){
		location="boardPro.jsp?GUBUN=D&q_no="+q_no;		
	}
}