;(function(globle,undefined){
    "use strict";
    var _global;
    var patterns = {
        min_length: function(value, len, error_msg){
            if(value.length < len){
                return error_msg;
            }
        },
        max_length: function(value, len, error_msg){
            if(value.length > len){
                return error_msg;
            }
        },
        is_equal: function (value,value2,error_msg){
            if(value != value2){
                return error_msg;
            }
        },
        not_include: function(value,str,error_msg){
            if(value.indexOf(str) != -1){
                return error_msg;
            }
        },
        is_mobile: function(value,error_msg){
            if(!(/^1[34578]\d{9}$/.test(value))){
                return error_msg;
            }
        },
        is_pwd: function(value,error_msg){
            var reg = /^[A-Za-z0-9]+$/;
            if(!reg.test(value)){
                return error_msg;
            }
        },
        is_letter: function(value,error_msg){
          var reg = /[a-zA-z]/;
            if(!reg.test(value)){
                return error_msg;
            }
        },
        is_email: function(value,error_msg){
            var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            if(!reg.test(value)){
                return error_msg;
            }
        },
        is_not_empty: function(value,error_msg){
            if(value === ""){
                return error_msg;
            }
        }
    };
    var Validator = function(){
        this.cache = [];
    };
    Validator.prototype.add = function (value,rules){
        var self = this;
        for(var i = 0;i<rules.length;i++){
            (function(){
                var rule = rules[i];
                var pattern_arr = rule.pattern.split(":");
                self.cache.push(function(){
                    var pattern = pattern_arr.shift();
                    pattern_arr.unshift(value);
                    pattern_arr.push(rule.error_msg);
                    return patterns[pattern].apply(value,pattern_arr)
                });
            })(rules);
        }
    };
    Validator.prototype.start = function(){
        for(var i = 0;i<this.cache.length;i++){
            var pattern = this.cache[i];
            var error_msg = pattern();
            if(error_msg){
                return error_msg;
            }
        }
    };
    _global = (function(){ return this || (0, eval)('this'); }());

    !('Validator' in _global) && (_global.Validator = Validator);

})();
