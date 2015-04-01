$(document).ready(function(){
	$("div.nav li").hover(function(){
		$(this).addClass("indexmoveNav");
	},function(){
		$(this).removeClass("indexmoveNav");
	});
});

function AddFavorite(sURL, sTitle)
{
	try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("Add Favorite failed,please use Ctrl+D to add the url to favorite");
        }
    }
}

function SetHome(obj,vrl){
        try{
              obj.style.behavior='url(#default#homepage)';
              obj.setHomePage(vrl);
        }
        catch(e){
            if(window.netscape) {
                    try {
                            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                    }
                    catch (e) {
                    	console.log(e);
                            alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                    }
                    var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                    prefs.setCharPref('browser.startup.homepage',vrl);
             }
        }
}

function doSearch(){
	if($("#key").val()=='Please input the search content' || $("#key").val()=='' ){
		alert("Please input the search content");
		return false;
	}		
	return true;
}