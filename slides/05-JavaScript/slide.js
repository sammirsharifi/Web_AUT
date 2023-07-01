
function setheight(){
	var b = document.getElementsByTagName("body");
	b[0].style.height = (window.innerHeight - 20)+"px";			
}

function otherPage(id,pp,direction){
	var link = document.getElementById(id);
	var nextpn = pp + direction;
	if(nextpn < 10)
		nextpn = "slide_0"+ nextpn +".html" 
	else
		nextpn = "slide_"+ nextpn +".html"; 
	link.href = nextpn;		
}

function fixlinks(){
	var url = window.location.pathname;
	var filename = url.substring(url.lastIndexOf('/')+1);
	var tmp = filename.substring(filename.indexOf('_')+1);
	var pp = parseInt(tmp.substring(0, tmp.indexOf('.htm')),10);
	document.getElementById("pagenumber").innerHTML=pp;	
	otherPage("prevpage", pp, -1);
	otherPage("nextpage", pp, 1);
}
