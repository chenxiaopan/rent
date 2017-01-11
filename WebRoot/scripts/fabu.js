// JavaScript Document

	
//验证标题
	 function checktitle(){
		//获得文本框的值
		var $val=$("#add_action_title").val();
		 var reg=/^[\u4e00-\u9fa5]+$/;
		 if($val==""){
			 
				 return false;
				 
		  }else if(!reg.test($val)){
		
			     return false;
			 }else {
		     return true;
			 }
		 
	}
	
//验证面积
function checkfloorage(){
	  //获得文本框的值
		var $val=$("#add_action_floorage").val();
		//正则表达式	
		var reg=/^\d+$/;
		//判断
		if($val==""){
          
			return false;
		}else if(!reg.test($val)){
		  
		    return false;
		}
		
		return true;
	}
	
	
//验证价格
function checkprice(){
	  //获得文本框的值
		var $val=$("#add_action_price").val();
		//正则表达式		
		var reg=/^\d+$/;
		//判断
		if($val==""){
          
			return false;
		}else if(!reg.test($val)){
		
		    return false;
		}
		
		return true;
	}

	
	 
	   //验证电子邮箱
	function checkemail(){
		var $val=$("#email").val();		
  //[\w-]就是匹配字母和 - 减号。
  //正则表达式中\w都被介绍为匹配任何单词字符,包括字母和下划线，等效于[A-Za-z0-9] 
			var reg=/^[\w-]+(\.[\w-]+)*@[\w-]{2,3}(\.[\w-]+)+$/;
		if($val==""){
            $("#email_prompt").text("邮箱不能为空");
			return false;
		}else if(!reg.test($val)){
		$("#email_prompt").text("邮箱格式错误");
		  return false;
		}
		$("#email_prompt").text("");
		return true;
	 }
	 
	 //验证手机号码
  function checkmobile(){
	    //获得文本框的值
		var $val=$("#add_action_contact").val();
		//正则表达式		
		var reg=/^1[358]\d{9}$/;
		//判断
		if($val==""){
         
			return false;
		}else if(!reg.test($val)){
		  
		    return false;
		}
	
		return true;
	}
		


  
