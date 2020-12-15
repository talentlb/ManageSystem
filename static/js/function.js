function tauch_tabs(now, total, tabel){
    for(var i=1;i<=total;i++){
        if(now==i){
            document.getElementById(tabel + "_" +i).style.display = 'block';
            document.getElementById(tabel+"_css"+i).className = "active";
        }else{
            document.getElementById(tabel+ "_" +i).style.display = 'none';
            document.getElementById(tabel+"_css"+i).className = "";
        }
    }
}

function EnterPress(e){ //传入 event
var e = e || window.event;
if(e.keyCode == 13){
    search();
    }
}
function search(){
    keyword = document.getElementById('keyword').value;

    if (keyword == ''){
        alert('请输入搜索关键词');
        document.getElementById('keyword').focus();
        return false;
    }else{
        window.location='/technical/search.html?kw='+keyword
    }
}

function theckform(){
    xq_title = document.getElementById('xq_title').value;
    lxr = document.getElementById('lxr').value;
    tel = document.getElementById('tel').value;

    if(xq_title == ""){
        alert('请输入您的需求');
        document.getElementById('xq_title').focus()
        return false;
    }
    if(lxr == ""){
        alert('请输入联系人姓名');
        document.getElementById('lxr').focus()
        return false;
    }
    if(tel == ""){
        alert('请输入您的联系电话');
        document.getElementById('tel').focus()
        return false;
    }
}
