/**
 * 
 */
let eUtil = {}

//str이 비어 있으면  true
//그렇치 않으면 false
//eUtil.ISEmpty($("#userId").val())
eUtil.ISEmpty = function(str){
	if(null !=str  &&  undefined != str){
		str = str.toString();
		
		//공백 제거: " james " -> "james"
		if(str.replace(/ /gi,"").length == 0){ 
			return true;
		}
	}
	
	return false
	
}
