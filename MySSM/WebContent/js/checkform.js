function checkform(jsonObj){
		//	console.log(jsonObj);
			var objvalue = jsonObj.obj.value;
			var name = $(jsonObj.obj).attr("name");
			var span = $("<span id='"+name+"msg' class='help-block m-b-none'></span>");
			$("#"+name+"msg").remove();
			$(jsonObj.obj).after(span);
			if(jsonObj.require){
				if(objvalue==""){
					$("#"+name+"msg").text(jsonObj.nullmsg).css("color","red");
					return false;
				}else{
					if(jsonObj.re.test(objvalue)){
						return true;
					}else{
						$("#"+name+"msg").text(jsonObj.errormsg).css("color","red");
						return false;
					}
				}
			}else{
				return true;
			}
		}