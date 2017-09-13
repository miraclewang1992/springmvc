function goToPage(form, index) {
	var formEle = document.forms[form];
	formEle.elements["pageIndex"].value = index;
	formEle.submit();
}
function jumpPage(form, totalPages) {
	var index = document.getElementById("jumpPage").value;
	if (index > totalPages) {
		index = totalPages;
	}
	
	var formEle = document.forms[form];
	formEle.elements["pageIndex"].value = index;
	formEle.submit();
}