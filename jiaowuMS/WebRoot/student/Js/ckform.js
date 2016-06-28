/*
 jquery琛ㄥ崟楠岃瘉鎻掍欢銆俵ast edit by rongrong 2011.03.29
 */

var __check_form_last_error_info = [];

var check_form = function (formname, opt) {
    var formobj;				//鎸囧畾褰揿墠琛ㄥ崟
    var e_error = "";
    var focus_obj = "";			//绗竴涓嚭鐜伴敊璇镀?
    var error = [];
    var _temp_ajax = new Array;	//ajax镙￠獙璇锋眰镄勭紦瀛?
    var opt = opt || {};		//阃夐」
    opt = $.extend({
        type: 'form',			//镙￠獙瀵硅薄 form ,elem
        trim: true,				//镊姩trim
        errtype: 0,				//杩斿洖阌栾淇℃伅锛? 鍏ㄩ儴 1 链€鍚庝竴鏉?2 绗竴鏉?
        showtype: 0				//阌栾鏄剧ず鏂瑰纺 0 寮瑰嚭  1 涓嶅脊鍑?
    }, opt);
    if (opt['type'] == 'elem') {
        formobj = $(formname);
        formname = $('body');
    }
    else {
        formobj = $('input,textarea,select,button', formname);
    }
    formobj.each(function (i) {
        var formobj_i = $(this);
        var jscheckflag = formobj_i.attr("jscheckflag");
        var obj_tag = formobj_i.attr("tagName");
        jscheckflag = jscheckflag == undefined ? 1 : jscheckflag;
        if (jscheckflag == 0)
            return true;
        var jscheckrule = formobj_i.attr("jscheckrule") || '';
        var jscheckerror = formobj_i.attr("jscheckerror");
        var jschecktitle = formobj_i.attr("jschecktitle") || '琛ㄥ崟';
        var jsmaxlen = formobj_i.attr("maxLength");

        //镓ц镊姩trim
        if (jscheckrule.indexOf('trim=0') == -1 && opt['trim']) {
            cf_trim(formobj_i, 1);
        }

        //鍒濆鍖杍scheckrule
        //镙￠獙HTML
        if (jscheckrule.indexOf('html=') == -1) {
            jscheckrule += ';html=0';
        }

        var jsvalue = formobj_i.val();
        var errflag = 0;//阌栾镙囱
        if (obj_tag == 'TEXTAREA' && (jsmaxlen > 0 ? (jsvalue.length > jsmaxlen ? 1 : 0) : 0)) {
            jscheckerror = (jschecktitle ? jschecktitle : formobj_i.attr('name')) + " 涓嶅缑瓒呰绷 " + jsmaxlen + " 瀛?;
            errflag = 1;
        }
        else if (jscheckrule) {
            errflag = docheck(formobj_i, jscheckrule) ? errflag : 1;
        }
        if (errflag) {
            e_error = jscheckerror ? jscheckerror : jschecktitle + ' ' + formobj_i.data('jscheckerror');
            error.push(e_error);
            if (focus_obj == "") focus_obj = formobj_i;									//鑱氱剑绗竴涓嚭鐜伴敊璇璞?
            if (this.oldback == undefined) this.oldback = this.style.backgroundColor;	//璁板綍铡熷簳鑹?
            this.style.backgroundColor = '#FFFF00';									//楂树寒阌栾琛ㄥ崟瀵硅薄
        } else {
            if (this.oldback != undefined) this.style.backgroundColor = this.oldback;		//杩桦师搴曡壊
        }
    });
    //澶勭悊ajax镙￠獙
    if (!error) {
        for (var i in _temp_ajax) {
            var obj = _temp_ajax[i].obj;
            var str = _temp_ajax[i].str;
            var jscheckerror = obj.attr('jscheckerror');
            var jschecktitle = obj.attr('jschecktitle');
            if (_cf_ajax.call(obj.get(0), obj, str) != true) {
                e_error = jscheckerror ? jscheckerror : jschecktitle + ' ' + obj.data('jscheckerror');
                error.push(e_error);
                if (focus_obj == "") focus_obj = obj;											//鑱氱剑绗竴涓嚭鐜伴敊璇璞?
                if (obj.get(0).oldback == undefined) obj.get(0).oldback = obj.get(0).style.backgroundColor;	//璁板綍铡熷簳鑹?
                obj.get(0).style.backgroundColor = '#FFFF00';							//楂树寒阌栾琛ㄥ崟瀵硅薄
                break;
            }
        }
    }
    if (error.length > 0) {
        __check_form_last_error_info = error;
        if (opt.showtype == 0)
            alert("琛ㄥ崟瀛桦湪浠ヤ笅阌栾:\n" + error.join("\n"));

        try {
            focus_obj.focus()
        } catch (e) {
        }
        ;
        return false;
    }
    return true;
    //镙￠獙涓诲嚱鏁?
    function docheck(el, jscheckrule) {
        var jscheckrule = jscheckrule || el.attr("jscheckrule");
        var e_rules = jscheckrule.split(";");
        var e_rule, e_rules_len = e_rules.length;
        for (var k = 0; k < e_rules_len; k++) {
            var rule_index = e_rules[k].indexOf("=");
            if (rule_index > -1) {
                e_rule = [e_rules[k].substr(0, rule_index), e_rules[k].substr(rule_index + 1)];
                if (e_rule.length == 2) {
                    //e_rule_para = e_rule_para.replace(new RegExp("\'","gm"),"\\'");
                    var cf_func = "cf_" + e_rule[0] + "(el,e_rule[1])";
                    try {
                        if (!eval(cf_func)) return false;
                    } catch (e) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    //妫€娴嬩腑鑻辨枃娣峰悎闀垮害
    function strLen(s) {
        var i, str1, str2, str3, nLen;
        str1 = s;
        nLen = 0;
        for (i = 1; i <= str1.length; i++) {
            str2 = str1.substring(i - 1, i)
            str3 = escape(str2);
            if (str3.length > 3) {
                nLen = nLen + 2;
            }
            else {
                nLen = nLen + 1;
            }
        }
        return nLen;
    }

    //////////////////////////////////////////**** 妫€娴嫔姛鑳藉嚱鏁扮粍****///////////////////////////////////
    //镊姩trim鎺夌┖镙硷紝涓€鑸姞鍦ㄨ鍒欐渶鍓嶉溃trim=1
    function cf_trim(obj, flag) {
        if (flag == 1) {
            var str = obj.val();
            str = $.trim(str);
            try {
                obj.val(str);
            } catch (e) {
            }
            ;//file镞朵细鍑洪敊
        }
        return true;
    }

    //鍒ゆ柇鏄惁涓虹┖
    function cf_null(obj, cannull) {
        if (cannull == 1) return true;
        var obj_type = obj.attr('type'), str;
        if (obj_type == 'checkbox' || obj_type == 'radio') {
            var objname = obj.attr('name');
            str = formobj.filter(':' + obj_type + '[name=' + objname + '][checked]').map(function () {
                return this.value;
            }).get().join(',');
        }
        else {
            str = obj.val();
        }
        str = str && typeof(str) == 'object' ? str.join(',') : str;
        if (cannull == 0) {
            str = $.trim(str);
        }
        if (cannull == 1 || str != "") return true;
        obj.data('jscheckerror', '涓嶈兘涓虹┖');
        return false;
    }

    //链€澶ч昵搴?
    function cf_maxlen(obj, num) {
        var str = obj.val();
        if (str == "" || strLen(str) <= num) return true;
        obj.data('jscheckerror', '闀垮害涓嶈兘澶т簬 ' + num + ' 瀛楄妭');
        return false;
    }

    //链€灏忛昵搴?
    function cf_minlen(obj, num) {
        var str = obj.val();
        if (str == "" || strLen(str) >= num) return true;
        obj.data('jscheckerror', '闀垮害涓嶈兘灏忎簬 ' + num + ' 瀛楄妭');
        return false;
    }

    //链€澶у€?
    function cf_maxnum(obj, num) {
        var str = obj.val();
        if (str * 1 <= num * 1) return true;
        obj.data('jscheckerror', '涓嶈兘澶т簬 ' + num);
        return false;
    }

    //链€澶у瓧鏁?
    function cf_maxlencn(obj, num) {
        var str = obj.val();
        if (str == "" || str.length <= num) return true;
        obj.data('jscheckerror', '瀛楁暟涓嶈兘澶т簬 ' + num + ' 瀛?);
        return false;
    }

    //链€灏忓瓧鏁?
    function cf_minlencn(obj, num) {
        var str = obj.val();
        if (str == "" || str.length >= num) return true;
        obj.data('jscheckerror', '瀛楁暟涓嶈兘灏忎簬 ' + num + ' 瀛?);
        return false;
    }

    //鎸囧畾瀛楁暟
    function cf_lencn(obj, num) {
        var str = obj.val();
        if (str == "" || str.length == num) return true;
        obj.data('jscheckerror', '瀛楁暟蹇呴』绛変簬 ' + num + ' 瀛?);
    }

    //链€灏忓€?
    function cf_minnum(obj, num) {
        var str = obj.val();
        if (str == "" || str * 1 >= num * 1) return true;
        obj.data('jscheckerror', '涓嶈兘灏忎簬 ' + num);
        return false;
    }

    //鎸囧畾闀垮害
    function cf_len(obj, num) {
        var str = obj.val();
        if (str == "" || strLen(str) == num) return true;
        obj.data('jscheckerror', '闀垮害蹇呴』绛変簬 ' + num + ' 瀛楄妭');
    }

    //鏄惁闾欢鍦板潃
    function cf_email(obj, mustcheck) {
        var str = obj.val();
        if (str == "" || !mustcheck) return true;
        rx = "^([\\w\\_\\.])+@([\\w]+\\.)+([\\w])+$";
        if (cf_regexp(obj, rx)) return true;
        obj.data('jscheckerror', '蹇呴』涓?EMAIL 镙煎纺');
        return false;
    }

    //涓庡彟涓€瀵硅薄镄勫€间竴镊?
    function cf_sameto(obj, el) {
        var str = obj.val();
        if (str == "" || str == formobj.filter("#" + el).val()) return true;
        el = formobj.filter("#" + el).attr('jschecktitle') || el;
        obj.data('jscheckerror', '蹇呴』绛変簬 ' + el + ' 镄勫€?);
        return false;
    }

    //涓庡彟涓€瀵硅薄镄勫€间笉涓€镊?
    function cf_differentto(obj, el) {
        var str = obj.val();
        if (str == "" || str == formobj.filter("#" + e1).val()) return true;
        obj.data('jscheckerror', '蹇呴』涓岖瓑浜?' + el + ' 镄勫€?);
        return false;
    }

    //涓嶈兘涓烘煇浜涘€?
    function cf_nosame(obj, para) {
        var str = obj.val();
        if (str == "") return true;
        var p_arr = para.split(",");
        var p_arrlen = p_arr.length;
        for (var l = 0; l < p_arrlen; l++) {
            if (p_arr[l] == str) {
                obj.data('jscheckerror', '涓嶈兘绛変簬 ' + para.join(' 鎴?'));
                return false;
                break;
            }
        }
        return true;
    }

    //鍏佽瀛楃锣冨洿
    function cf_charset(obj, para) {
        var str = obj.val();
        if (str == "") return true;
        var c_rule = '';
        var p_arr = para.split(",");
        var p_arrlen = p_arr.length;
        var para_arr = [];
        for (var l = 0; l < p_arrlen; l++) {
            if (p_arr[l] == 'en') {
                c_rule += "a-zA-Z";
                para_arr[l] = '瀛楁瘝';
            }
            else if (p_arr[l] == 'num') {
                c_rule += "0-9";
                para_arr[l] = '鏁板瓧';
            }
            else if (p_arr[l] == 'fl') {
                c_rule += "0-9\\.0-9";
                para_arr[l] = '灏忔暟';
            }
            else if (p_arr[l] == 'cn') {
                c_rule += "\\u4E00-\\u9FA5";
                para_arr[l] = '涓枃';
            }
            else if (p_arr[l] == 'ul') {
                c_rule += "_";
                para_arr[l] = '涓嫔垝绾?;
            }
        }
        if (c_rule == "")    return true;
        else {
            var t_rule = "^[" + c_rule + "]*$";
            if (cf_regexp(obj, t_rule)) return true;
            obj.data('jscheckerror', '蹇呴』涓篬' + para_arr.join(',') + ']');
            return false;
        }
    }

    //镊畾涔夋鍒椤尮閰?
    function cf_regexp(obj, rx) {
        var str = obj.val();
        if (str == "") return true;
        if (rx == "")return true;
        var r_exp = new RegExp(rx, "ig");
        if (r_exp.test(str)) return true;
        obj.data('jscheckerror', '鍚湁闱炴硶瀛楃');
        return false;
    }

    //镙￠獙HTML镙囩<HTML>
    function cf_html(obj, flag) {
        var str = obj.val();
        if (str == "" || str == null) return true;
        if (flag == 1) return true;
        if (str.indexOf('<') == -1 && str.indexOf('>') == -1) return true;
        obj.data('jscheckerror', '鍚湁html瀛楃');
        return false;
    }

    //ajax镙￠獙
    function cf_ajax(obj, str) {
        _temp_ajax = _temp_ajax.concat({obj: obj, str: str});
        return true;
        //return _cf_ajax.call(obj.get(0),obj,str);
    }

    function _cf_ajax(obj, str) {
        var str_obj = eval('(' + str + ')');
        var resp = $.ajax({
            url: str_obj.url,
            async: false,
            data: str_obj.data
        }).responseText;
        if (resp === 'true') return true;
        obj.data('jscheckerror', resp);
        return false;
    }

    function get_param(str) {
        return eval('(' + str + ')');
    }

    //璋冨嚱鏁?call = {func:[this.value,1,2,3]}
    function cf_call(obj, str) {
        var str_obj = get_param.call(obj.get(0), str);
        for (var func in str_obj) {
            var resp = window[func].apply(undefined, str_obj[func]);
            if (resp !== true) {
                obj.data('jscheckerror', resp);
                return false;
            }
        }
        return true;
    }
}

check_form.get_error = function () {
    return __check_form_last_error_info;
};
