//===================================================
// CreateLiveCMS Version4.0 Ajax(By ÷����)
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
var Cl_SpareVar=0;  //���ñ���

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
//Post��ַ,Post����,�ɹ���ִ�й���,ʧ�ܺ�ִ�й���,��ʱִ��ʱ��
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
				if (SucDo!=""){setTimeout(SucDo,Timeout);}//��ʱִ�к���
			}else{
				if (ErrDo!=""){setTimeout(ErrDo,10);}
			}
		}else{
			switch(Ajax.readyState){
			case 1:
				break;//�������ӷ�����;
			case 2:
				break;//�������������������;
			case 3:
				break;//���ڽ��շ�������;
			default:
				break;//;
			}
		}
	}
	Ajax.send(PostData);
}
//�û���¼
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
	//�Ա����м��ж�
	if (UserName==""){
		outObj.innerHTML="<font color=\"#ff0033\">�û�������Ϊ�գ�</font>";
		document.getElementById("UserName").focus();
		return false;}
	if (UserPass==""){
		outObj.innerHTML="<font color=\"#ff0033\">���벻��Ϊ�գ�</font>";
		document.getElementById("Password").focus();
		return false;}
	if (CookieDate){post += "&CookieDate="+escape(CookieDate.value);}
	if (CodeStr){
		if (CodeStr.value==""){
		outObj.innerHTML="<font color=\"#ff0033\">��֤�벻��Ϊ�գ�</font>";
		CodeStr.focus();
		return false;}
		post += "&CodeStr="+escape(CodeStr.value);}
	//�����Ϣ
	document.getElementById("sydl").disabled=true;
	if (outObj){outObj.innerHTML="<font color=\"#0000ff\">������֤��¼��Ϣ...</font>";}
	Cl_DoAjax(url,post,"AjaxUserLoginSuc()","AjaxUserLoginErr()",1);
}
//�û���¼/�˳��ɹ�
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
//�û���¼ʧ��
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
//�û��˳�
function AjaxUserLogout(dir,cid,type) {
	Cl_InstallDir = dir;
	Cl_ChannelID= cid;
	Cl_SpareVar = type;
	var outObj	= document.getElementById("ShowUserLogin");
	var url		= Cl_InstallDir + "User/Logout.asp";
	var post	= "Ajax=1";
	if (outObj){outObj.innerHTML="<font color=\"#0000ff\">�����˳���¼�����Ժ�...</font>";}
	Cl_DoAjax(url,post,"AjaxUserLoginSuc()","",1);
}