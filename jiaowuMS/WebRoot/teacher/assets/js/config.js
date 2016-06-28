(function ($) {

  var baseUrl = '',         //缃戠珯镄勬抵鐩綍鍦板潃锛屽彂甯冨埌绾夸笂镞朵娇鐢?
    jsBase = '/assets/js';
  
  function isRelative(url){
    if(!/:/.test(url)){
      return true;
    }
  }
  function formatUrl(url){
    if(isRelative(url)){
      var path = getCurrentPath();
      return path +'/'+ url;
    }
    return url;
  }
  function getCurrentPath(){
    var url = location.href,
      lastIndex;
    url = url.replace(/\?.*$/,'').replace(/\#.*$/,'');
    lastIndex = url.lastIndexOf('/');
    return url.substring(0,lastIndex);
  }
  function getBaseUrl(){    //镙规嵁config.js镄勮矾寰勫彇baseUrl
    var scripts = $('script'),
      rst = '';
    $.each(scripts,function(index,script){
      var src = script.src,
        lastIndex = src.indexOf(jsBase + '/config');
      if(lastIndex !== -1){
        rst = src.substring(0,lastIndex);
        return false;
      }
    });
    return formatUrl(rst);
  }

  if(!baseUrl){//濡傛灉链寚瀹氶」鐩矾寰勶紝杩涜鍖归厤銆?
    baseUrl = getBaseUrl();
  }

  BUI.config({
    alias : {
      'common' : baseUrl + jsBase + '/common',
      'module' : baseUrl + jsBase + '/module'
    },/**/
    map : [ //璋冭瘯鐜涓嬩娇鐢?*.js'锛屽鏋滃彂甯冧笂绾垮墠锛屼娇鐢?-min.js铡绘帀涓嬮溃镄刴ap
      //[/common\/(.*)-min.js/,'common/$1.js'],
      [/module\/(.*)-min.js/,'module/$1.js']
    ]
    
  });

})(jQuery);