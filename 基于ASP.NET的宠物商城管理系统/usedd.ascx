<%@ Control Language="C#" AutoEventWireup="true" CodeFile="usedd.ascx.cs" Inherits="usedd" %>

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/location.js"></script>
<script type="text/javascript" src="js/YlChinaArea.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".ChinaArea").jChinaArea({
		 aspnet:true,
		 s1:"广东省",//默认选中的省名
		 s2:"江门市",//默认选中的市名
		 s3:"蓬江区"//默认选中的县区名
	})
})
</script>
<div class="ChinaArea">
     <select id="province" name="province" style="width: 100px;"></select>
     <select id="city" name="city" style="width: 100px;"></select>
     <select id="county" name="county" style="width: 100px;"> </select>
       <asp:HiddenField runat="server" ID="Tprovince" />
      <asp:HiddenField runat="server" ID="TCity" />
      <asp:HiddenField runat="server" ID="TCounty" /> 
      </div>