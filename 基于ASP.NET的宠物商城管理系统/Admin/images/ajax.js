//===================================================
// CreateLiveCMS Version4.0 Ajax(By 梅傲风)
//===================================================
// Mail: support@aspoo.cn, Info@aspoo.cn
// Msn : support@aspoo.cn, Clw866@hotmail.com
// Web : http://www.aspoo.cn
// Bbs : http://bbs.aspoo.cn
// Copyright (C) 2007 Aspoo.Cn All Rights Reserved.
//===================================================

var Cl_AjaxresponseText;
var Cl_AjaxDoSuc=0;
var Cl_InstallDir="/";
var Cl_ChannelID=0;
var Cl_SpareVar=0;  //备用变量

function Cl_CreateAjaxObj()
{
	var XmlHttp;
	//windows
	try {
		XmlHttp = new ActiveXObject("Msxml2.XMLHTTP.3.0");
	} catch (e) {
		try {
			XmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				XmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				XmlHttp = false;
			}
		}
	}
	//other
	if (!XmlHttp)
	{
		try {
			XmlHttp = new XMLHttpRequest();
		} catch (e) {
			XmlHttp = false;
		}
	}
	return XmlHttp;
}
//Post地址,Post数据,成功后执行过程,失败后执行过程,延时执行时间
function Cl_DoAjax(PostUrl,PostData,SucDo,ErrDo,Timeout)
{
	var Ajax = new Cl_CreateAjaxObj();
	Ajax.open("POST", PostUrl, true);
	Ajax.setRequestHeader("content-length",PostData.length); 
	Ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	Ajax.onreadystatechange=function() {
		if (Ajax.readyState==4&&Ajax.status==200) {
			Cl_AjaxresponseText = Ajax.responseText;
			if (Cl_AjaxresponseText=="OK") {
				Cl_AjaxDoSuc = 1 ;
				if (SucDo!=""){setTimeout(SucDo,Timeout);}//延时执行函数
			}else{
				if (ErrDo!=""){setTimeout(ErrDo,10);}
			}
		}else{
			switch(Ajax.readyState){
			case 1:
				break;//正在连接服务器;
			case 2:
				break;//正在向服务器发送数据;
			case 3:
				break;//正在接收返回数据;
			default:
				break;//;
			}
		}
	}
	Ajax.send(PostData);
}
//用户登录
function AjaxUserLogin(dir,cid,type) {
	Cl_InstallDir = dir;
	Cl_ChannelID= cid;
	Cl_SpareVar = type;
	var outObj	= document.getElementById("LoginMessage");
	var UserName= document.getElementById("UserName").value;
	var UserPass= document.getElementById("Password").value;
	var CookieDate= document.getElementById("CookieDate");
	var CodeStr = document.getElementById("CodeStr");
	var url		= Cl_InstallDir + "User/Login.asp?Action=CheckLogin";
	var post	= "Ajax=1&UserName="+escape(UserName)+"&Password="+escape(UserPass);
	//对表单进行简单判断
	if (UserName==""){
		outObj.innerHTML="<font color=\"#ff0033\">用户名不能为空！</font>";
		document.getElementById("UserName").focus();
		return false;}
	if (UserPass==""){
		outObj.innerHTML="<font color=\"#ff0033\">密码不能为空！</font>";
		document.getElementById("Password").focus();
		return false;}
	if (CookieDate){post += "&CookieDate="+escape(CookieDate.value);}
	if (CodeStr){
		if (CodeStr.value==""){
		outObj.innerHTML="<font color=\"#ff0033\">验证码不能为空！</font>";
		CodeStr.focus();
		return false;}
		post += "&CodeStr="+escape(CodeStr.value);}
	//输出信息
	document.getElementById("sydl").disabled=true;
	if (outObj){outObj.innerHTML="<font color=\"#0000ff\">正在验证登录信息...</font>";}
	Cl_DoAjax(url,post,"AjaxUserLoginSuc()","AjaxUserLoginErr()",1);
}
//用户登录/退出成功
function AjaxUserLoginSuc() {
	var Ajax = new Cl_CreateAjaxObj();
	Ajax.open("POST", Cl_InstallDir + "ShowLogin.asp?Ajax=1&Type="+Cl_SpareVar+"&ChannelID="+Cl_ChannelID, true);
	//Ajax.setRequestHeader("content-length",PostData.length); 
	Ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	Ajax.onreadystatechange=function() {
		if (Ajax.readyState==4&&Ajax.status==200) {
			document.getElementById("ShowUserLogin").innerHTML=Ajax.responseText;
		}
	}
	Ajax.send(null);
}
//用户登录失败
function AjaxUserLoginErr() {
	var Obj;
	Obj = document.getElementById("LoginMessage");
	if (Obj){Obj.innerHTML="<font color=\"#ff0033\">"+Cl_AjaxresponseText+"</font>";}
	Obj = document.getElementById("CodeStr");
	if (Obj){Obj.value="";}
	Obj = document.getElementById("LoginCode");
	if (Obj){Obj.innerHTML="<img src=\""+Cl_InstallDir+"Inc/Cl_GetCode.asp?type=GetCode\" id=\"logincode\" />";}
	document.getElementById("sydl").disabled=false;
}
//用户退出
function AjaxUserLogout(dir,cid,type) {
	Cl_InstallDir = dir;
	Cl_ChannelID= cid;
	Cl_SpareVar = type;
	var outObj	= document.getElementById("ShowUserLogin");
	var url		= Cl_InstallDir + "User/Logout.asp";
	var post	= "Ajax=1";
	if (outObj){outObj.innerHTML="<font color=\"#0000ff\">正在退出登录，请稍候...</font>";}
	Cl_DoAjax(url,post,"AjaxUserLoginSuc()","",1);
}