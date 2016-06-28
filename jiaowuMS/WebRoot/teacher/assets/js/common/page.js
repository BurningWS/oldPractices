$(function () {
  
  var CLS_ACTION = 'page-action',
    FIELD_MAP = {
      'data-id' :'id',
      'title' : 'title',
      'data-href' : 'href',
      'data-close' : 'isClose',
      'data-search' : 'search',
      'data-mid' : 'moduleId',
      'data-type' : 'type'
    };

  function parseParams(attrs){
    var rst = {};
    $.each(attrs,function(index,attr){
      var name = attr.nodeName,
        filedName = FIELD_MAP[name];
      if(filedName){
        rst[filedName] = attr.nodeValue;
      }
    });
    return rst;
  }
  //鍙湁鍦ㄨ妗嗘灦椤靛祵濂楁椂锛屾墠璧锋晥
  if(top.topManager){
    $('body').delegate('.' + CLS_ACTION, 'click',function(ev){
      var sender = ev.currentTarget,
        attrs = sender.attributes,
        params = parseParams(attrs);
      if(!params.type || params.type == 'open'){
        top.topManager.openPage(params);
        ev.preventDefault();
      }else if(params.type == 'setTitle'){
        top.topManager.setPageTitle(params.title,params.moduleId);
      }else{
        ev.preventDefault();
        top.topManager.operatePage(params.moduleId,params.id,params.type);
      }
    });
  }
  
});