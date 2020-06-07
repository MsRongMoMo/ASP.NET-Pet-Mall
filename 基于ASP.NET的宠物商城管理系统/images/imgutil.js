function DrawImage(ImgD,w,h) {
	var image = new Image();
	image.src = ImgD.src;
	if (image.width > 0 && image.height > 0) {
		if((image.width>125 || image.width>w) || (image.height>125 || image.height>h)){
			if (image.width / image.height >= w / h) {
				//if (image.width > w) {
					ImgD.width = w;
					ImgD.height = (image.height * w) / image.width;
				//} else {
					//ImgD.width = image.width;
					//ImgD.height = image.height;
				//}
				ImgD.alt = image.width + "×" + image.height;
			} else {
				//if (image.height > h) {
					ImgD.height = h;
					ImgD.width = (image.width * h) / image.height;
				//} else {
					//ImgD.width = image.width;
					//ImgD.height = image.height;
				//}
				ImgD.alt = image.width + "×" + image.height;
			}
		}
	}
}
		
function preloadimg(url,id,w,h){
	var img=new Image();
	var obj = document.getElementById(id);
	obj.innerHTML="<p>加载中...</p>";
	img.onload=function(){
		obj.innerHTML="";
		DrawImage(img,w,h);
		obj.appendChild(img);
	};
	img.onerror=function(){
		obj.innerHTML="加载失败！";
	};
	img.border=0;
	img.src=url; 
}