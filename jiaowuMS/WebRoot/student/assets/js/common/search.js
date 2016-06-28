/**
 * @fileOverview 鎼灭储椤甸溃涓氩姟鎺т欢
 * @ignore
 */

define('common/search',['bui/common','bui/grid','bui/form','bui/data','bui/overlay'],function (require) {
  var BUI = require('bui/common'),
    Grid = require('bui/grid'),
    Data = require('bui/data'),
    Overlay = require('bui/overlay'),
    Form = require('bui/form');

  /**
   * @class Search
   * 鎼灭储椤电被
   */
  function Search(config){

    Search.superclass.constructor.call(this, config);
    this._init();
  }

  Search.ATTRS = {
    /**
     * 鏄惁镊姩镆ヨ锛屾墦寮€椤甸溃镞舵湭镣瑰向镆ヨ鎸夐挳镞舵槸鍚﹁嚜锷ㄦ煡璇?
     * @type {Boolean}
     */
    autoSearch :{
      value : true
    },
    /**
     * grid 瀹瑰櫒镄?id
     * @type {String}
     */
    gridId : {
      value : 'grid'
    },
    /**
     * 琛ㄥ崟镄勫鍣ㄧ殑id
     * @type {String}
     */
    formId : {
      value : 'searchForm'
    },
    /**
     * 镆ヨ鎸夐挳镄刬d
     * @type {Object}
     */
    btnId : {
      value : 'btnSearch'
    },
    /**
     * 琛ㄥ崟镄勯厤缃」
     * @type {Object}
     */
    formCfg : {
      value : {}
    },
    /**
     * grid 琛ㄦ牸镄勯厤缃」
     * @type {Object}
     */
    gridCfg : {

    },
    /**
     * 琛ㄥ崟瀵硅薄
     * @type {Object}
     */
    form : {

    },
    /**
     * 琛ㄦ牸瀵硅薄
     * @type {Object}
     */
    grid : {

    },
    /**
     * 鏁版嵁缂揿啿绫?
     * @type {Object}
     */
    store : {

    }
  }

  BUI.extend(Search,BUI.Base);

  BUI.augment(Search,{
    _init : function(){
      var _self = this;

      _self._initForm();
      _self._initStoreEvent();
      _self._initGrid();
      _self._initEvent();
      _self._initData();
    },
    //鍒濆鍖栦簨浠?
    _initEvent : function(){
      this._initDomEvent();
      this._initFormEvent();
      this._initGridEvent();
    },
    _initDomEvent : function(){
      var _self = this,
        btnId = _self.get('btnId'),
        store = _self.get('store'),
        form = _self.get('form');
      $('#'+btnId).on('click',function(ev){
        ev.preventDefault();
        form.valid();
        if(form.isValid()){
          _self.load(true);
        }
      });
    },
    //鍒濆鍖杅orm
    _initForm : function(){
      var _self = this,
        form = _self.get('form');
      if(!form){
        var formCfg = BUI.merge(_self.get('formCfg'),{
          srcNode : '#' + _self.get('formId')
        });
        form = new Form.HForm(formCfg);
        form.render();
        _self.set('form',form);
      }
    },
    _initFormEvent : function(){

    },
    //鍒濆鍖栬〃镙?
    _initGrid : function(){
      var _self = this,
        grid = _self.get('grid');
      if(!grid){
        var gridCfg = _self.get('gridCfg'),
          store = _self.get('store');
        gridCfg.store = store;
        gridCfg.render = '#' +_self.get('gridId'),
        grid = new Grid.Grid(gridCfg);
        grid.render();
        _self.set('grid',grid);
      }
    },
    _initGridEvent : function(){

    },
    _initData : function(){
      var _self = this,
        autoSearch = _self.get('autoSearch');
      if(autoSearch){
        _self.load(true);
      }
    },
    //鍒濆鍖栨暟鎹姞杞戒簨浠?
    _initStoreEvent : function(){
      var _self = this,
        store = _self.get('store');
      //澶勭悊寮傚父
      store.on('exception',function(ev){
        BUI.Message.Alert(ev.error);
      });
    },
    /**
     * 锷犺浇鏁版嵁
     * @param {Boolean} reset 鏄惁閲岖疆琛ㄦ牸镆ヨ镄勯〉鏁?
     */
    load : function(reset){
      var _self =this,
        form = _self.get('form'),
        store = _self.get('store'),
        param = form.serializeToObject();
      if(reset){
        param.start=0;
        param.pageIndex = 0;
      }
      store.load(param);
    }
  });

  Search.createStore = function(url,cfg){

    cfg = BUI.merge({
      autoLoad : false,
      url : url,
      pageSize : 30
    },cfg);
    return new Data.Store(cfg);
  };

  Search.createGridCfg = function(columns,cfg){
    cfg = BUI.merge({
      columns : columns,
      loadMask : true,
      bbar:{
        pagingBar:true
      }
    },cfg);
    
    return cfg;
  };

  Search.createLink = function(cfg){
    var temp = '<span class="page-action grid-command" data-id="{id}" data-href="{href}" title="{title}">{text}</span>';
    return BUI.substitute(temp,cfg);
  }
  return Search;
});