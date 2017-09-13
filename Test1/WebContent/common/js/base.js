var base = (function(window, scale) {
    var global = this,
        slice = Array.prototype.slice,
        objectPrototype = Object.prototype,
        toString = objectPrototype.toString,
        document = window.document,
        X = {
            version: '1.0.0',
            global: global,
            /**
             * isBoolean 如果为boolean类型返回true，否则返回false
             * @param {Object}
             * @return {Boolean}
             */
            isBoolean: function(value) {
                return typeof value === 'boolean';
            },
            /**
             * isNumber 如果为Number类型返回true，否则返回false
             * @param {Object}
             * @return {Boolean}
             */
            isNumber: function(value) {
                return typeof value === 'number' && isFinite(value);
            },
            /**
             * isString 如果为String类型返回true，否则返回false
             * @param {Object}
             * @return {Boolean}
             */
            isString: function(value) {
                return typeof value === 'string';
            },
            /**
             * isArray 如果为数组返回true，否则false
             * @return {Boolean}
             */
            isArray: ('isArray' in Array) ? Array.isArray : function(value) {
                return toString.call(value) === '[object Array]';
            },
            /**
             * isElement 如果为Element类型返回true，否则返回false
             * @param {Object}
             * @return {Boolean}
             */
            isElement: function(value) {
                return value ? value.nodeType === 1 : false;
            },
            /**
             * isFunction 如果为函数返回true，否则false
             * @param {Object} value The value to test
             * @return {Boolean}
             */
            isFunction: (typeof document !== 'undefined' && typeof document.getElementsByTagName('body') === 'function') ? function(value) {
                return toString.call(value) === '[object Function]';
            } : function(value) {
                return typeof value === 'function';
            },
            /**
             * isObject 如果为对象返回true，否则false
             * @return {Boolean}
             */
            isObject: (toString.call(null) === '[object Object]') ?
                function(value) {
                    return value !== null && value !== undefined && toString.call(value) === '[object Object]' && value.ownerDocument === undefined;
                } :
                function(value) {
                    return toString.call(value) === '[object Object]';
                },
            isPainObject: function(item) {
                if (typeof item === "object" && item !== null) {
                    var a = Object.getPrototypeOf(item);
                    return a === Object.prototype || a === null;
                }
                return false;
            },
            Obj2str: function(o) {
                if (o == undefined) {
                    return "";
                }
                var r = [];
                if (typeof o == "string") return "\"" + o.replace(/([\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
                if (typeof o == "object") {
                    if (!o.sort) {
                        for (var i in o)
                            r.push("\"" + i + "\":" + base.Obj2str(o[i]));
                        if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
                            r.push("toString:" + o.toString.toString());
                        }
                        r = "{" + r.join() + "}"
                    } else {
                        for (var i = 0; i < o.length; i++)
                            r.push(base.Obj2str(o[i]))
                        r = "[" + r.join() + "]";
                    }
                    return r;
                }
                return o.toString().replace(/\"\:/g, '":""');
            },
            /**
             * makeArray 返回数组
             * @return {Boolean}
             */
            makeArray: function(likeArr) {
                return slice.call(likeArr);
            },
            /**
             * mix 多对象合并，是否覆盖如果最后一个参数为true，则覆盖。否则不覆盖。
             * @param {Object} value The value to test
             * @return {Boolean}
             */
            mix: function(target, source) {
                var args = X.makeArray(arguments),
                    i = 1,
                    argsLen = args.length,
                    isCover = X.isBoolean(args[argsLen - 1]),
                    key;

                if (isCover === true) {
                    args.pop();
                }

                if (argsLen === 1) {
                    return target;
                }

                while (source = args[i]) {
                    for (key in source) {
                        if (isCover || !(key in target)) {
                            target[key] = source[key];
                        }
                    }
                    i++;
                }
                return target;
            },
            /**
             * cache 缓存函数
             * @return {Object}
             */
            cache: (function() {
                var data = {},
                    id = 0,
                    ikey = '_gid';    // internal key.
                return function(obj, key, val) {
                    var dkey = obj[ ikey ] || (obj[ ikey ] = ++id),
                        store = data[ dkey ] || (data[ dkey ] = {});
                    val !== undefined && (store[ key ] = val);
                    val === null && delete store[ key ];
                    return store[ key ];
                };
            })(),
            scale: scale,
            getScale: function() {
                return X.scale;
            },
            setScale: function(scale) {
                X.scale = scale;
            },
            setCookie: function(name, value, expires, path, domain, secure) {
                //name value expires path为必选参数
                var today = new Date();
                today.setTime(today.getTime());
                if (expires) {
                    expires = expires * 1000 * 60 * 60 * 24;
                }
                var expires_date = new Date(today.getTime() + (expires));
                document.cookie = name + "=" + escape(value) +
                    ((expires) ? ";expires=" + expires_date.toGMTString() : "") +
                    ((path) ? ";path=" + path : "") +
                    ((domain) ? ";domain=" + domain : "") +
                    ((secure) ? ";secure" : "");
            },
            getCookie: function(check_name) {
                var a_all_cookies = document.cookie.split(';');
                var a_temp_cookie = '';
                var cookie_name = '';
                var cookie_value = '';
                var b_cookie_found = false;
                for (var i = 0; i < a_all_cookies.length; i++) {
                    a_temp_cookie = a_all_cookies[i].split('=');
                    cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');
                    if (cookie_name == check_name) {
                        b_cookie_found = true;
                        if (a_temp_cookie.length > 1) {
                            cookie_value = unescape(a_temp_cookie[1].replace(/^\s+|\s+$/g, ''));
                        }
                        return cookie_value;
                        break;
                    }
                    a_temp_cookie = null;
                    cookie_name = '';
                }
                if (!b_cookie_found)
                {
                    return null;
                }
            },
            GetQueryString: function(name){
                var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if(r!=null)return  unescape(r[2]); return null;
            },
            cartCookie : {
                add : function(store_id,good_id,num,left_inventory){
                    try{
                        var cartCookie = $.parseJSON(base.getCookie('c_cart'));
                    }catch(e){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    cartCookie = cartCookie || {};
                    cartCookie[store_id] = cartCookie[store_id] || {};
                    if(cartCookie[store_id].constructor == Array){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    cartCookie[store_id][good_id] = cartCookie[store_id][good_id] || 0;
                    cartCookie[store_id][good_id] += num;
                    if(cartCookie[store_id][good_id] < 0 || cartCookie[store_id][good_id] > left_inventory){
                        alert('hi～这位水果控！今天本款果果你已经囤很多啦，欢迎明天再来！');
                        return false;
                    }
                    cartCookie = base.Obj2str(cartCookie);
                    base.setCookie('c_cart',cartCookie,1,'/');
                },
                remove : function(store_id,good_id,num,left_inventory){
                    try{
                        var cartCookie = $.parseJSON(base.getCookie('c_cart'));
                    }catch(e){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    cartCookie = cartCookie || {};
                    cartCookie[store_id] = cartCookie[store_id] || {};
                    if(cartCookie[store_id].constructor == Array){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    cartCookie[store_id][good_id] = cartCookie[store_id][good_id] || 0;
                    cartCookie[store_id][good_id] -= num;
                    if(cartCookie[store_id][good_id] < 0 || cartCookie[store_id][good_id] > left_inventory)
                        return false;
                    cartCookie = base.Obj2str(cartCookie);
                    base.setCookie('c_cart',cartCookie,1,'/');
                },
                getCount : function(store_id){
                    try{
                        var cartCookie = $.parseJSON(base.getCookie('c_cart'));
                    }catch(e){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    cartCookie = cartCookie || {};
                    cartCookie[store_id] = cartCookie[store_id] || {};
                    if(cartCookie[store_id].constructor == Array){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    var count = 0;
                    for(var s in cartCookie[store_id]){
                        count = count + cartCookie[store_id][s];
                    }
                    if(isNaN(count)){
                        base.cartCookie.clearCart();
                        window.location.reload();
                    }
                    return count;
                },
                getSimpleCount : function(store_id,good_id){
                    try{
                        var cartCookie = $.parseJSON(base.getCookie('c_cart'));
                    }catch(e){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    cartCookie = cartCookie || {};
                    cartCookie[store_id] = cartCookie[store_id] || {};
                    if(typeof(cartCookie[store_id][good_id]) == 'undefined'){
                        return 0;
                    }else if(isNaN(cartCookie[store_id][good_id])){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    return cartCookie[store_id][good_id];
                },
                getCartList : function(store_id){
                    try{
                        var cartCookie = $.parseJSON(base.getCookie('c_cart'));
                    }catch(e){
                        base.cartCookie.clearCart();
                        return false;
                    }
                    cartCookie = cartCookie || {};
                    cartCookie[store_id] = cartCookie[store_id] || {};
                    return cartCookie[store_id];
                },
                clearCart : function(){
                    var cartCookie = {};
                    cartCookie = base.Obj2str(cartCookie);
                    base.setCookie('c_cart',cartCookie,1,'/');
                    window.location.reload();
                },
                clearCartNoRefresh : function(){
                    var cartCookie = {};
                    cartCookie = base.Obj2str(cartCookie);
                    base.setCookie('c_cart',cartCookie,1,'/');
                }
            },
            cartBubble : function(store_id){
                var cart_count = base.cartCookie.getCount(store_id);
                if($('.footer-circle').length == 0){
                    $('.footer-tab-cart').append('<div class="footer-circle zoomInDown animated">'+cart_count+'</div>');
                }else if($('.footer-circle').length == 1){
                    $('.footer-tab-cart').append('<div class="footer-circle-2 zoomInDown animated"></div>');
                    setTimeout(function(){
                        $('.footer-circle-2').removeClass('zoomInDown');
                        $('.footer-circle').html(cart_count);
                    },800);
                }else{
                    $('.footer-circle-2').addClass('zoomInDown');
                    setTimeout(function(){
                        $('.footer-circle-2').removeClass('zoomInDown');
                        $('.footer-circle').html(cart_count);
                    },800);
                }
            },
            formatPrice : function(price){
                price = new Number(price)
                price = price.toFixed(2);
                return price;
            }
        };
    return X;
})(window, (function() {
    var scale = 1,
        $wrapper = document.getElementById('wrapper'),
        $body = document.getElementsByTagName('body')[0],
        windowWidth = document.documentElement && document.documentElement.clientWidth || document.body.clientWidth || window.innerWidth,
        deviceAgent = navigator.userAgent.toLowerCase();
    //if (deviceAgent.match(/(iphone|ipod|ipad|android|windows\s*phone|symbianos)/)) {
    //    scale = parseFloat(windowWidth / 320);
    //} else {
    //    scale = 1.5;
    //}
    scale = parseFloat(windowWidth / 320);

    //微信2.3版本的处理
    if(deviceAgent.match(/android\s*2.3/) && deviceAgent.match(/micromessenger/)){
        scale = 1;
    }
    if ($wrapper) {
        $wrapper.style.zoom = scale;
        $body.style.display = 'block';
    }
    var footTabNum = $('.footer-tab').length;
    $('.footer table td').css({'width' : 100/footTabNum+'%'})
    return scale;
})());

(function(X) {
    var fixDescriptor = function (item, definition, prop) {
        if(X.isPainObject(item)){
            if (!('enumerable') in item) {
                item.enumerable = true;
            }
        }else{
            item = definition[prop] = {
                value: item,
                enumerable: true,
                writable: true
            };
        }
        return item;
    };

    var funNames = Object.getOwnPropertyNames(Function);
    X.mix(X, {
        create: function (superclass, definition) {
            try {
                if (arguments.length === 1) {
                    definition = superclass;
                    superclass = Object;
                }
                if (typeof superclass !== "function") {
                    throw new Error("继承类必须是function");
                }
                var _super = superclass.prototype;
                var statics = definition.statics;
                delete definition.statics;
                //重新调整定义类
                Object.keys(definition).forEach(function (prop) {
                    var item = fixDescriptor(definition[prop], definition, prop);
                    if (X.isFunction(item.value) && X.isFunction(_super[prop])) {
                        var __super = function () {
                            return _super[prop].apply(this, arguments);
                        };
                        var __superApply = function (args) {
                            return _super[prop].apply(this, args);
                        };
                        var fn = item.value;
                        item.value = function () {
                            var t1 = this._super;
                            var t2 = this._superApply;
                            this._super = __super;
                            this._superApply = __superApply;
                            var ret = fn.apply(this, arguments);
                            this._super = t1;
                            this._superApply = t2;
                            return ret;
                        };
                    }
                });
                var Base = function () {
                    this.init.apply(this, arguments);
                };
                Base.prototype = Object.create(_super, definition);
                Base.prototype.constructor = Base;
                //确保一定存在init
                if (X.isFunction(Base.prototype.init) === false) {
                    Base.prototype.init = function () {
                        superclass.apply(this, arguments);
                    };
                }
                if(Object !== superclass){
                    Object.getOwnPropertyNames(superclass).forEach(function (name) {
                        if (funNames.indexOf(name) === -1) {
                            Object.defineProperty(Base, name, Object.getOwnPropertyDescriptor(superclass, name) || {});
                        }
                    });
                }
                if(X.isPainObject(statics)){
                    Object.keys(statics).forEach(function (name) {
                        if (funNames.indexOf(name) === -1) {
                            Object.defineProperty(Base, name, fixDescriptor(statics[name], statics, name));
                        }
                    });
                }
            }catch(e){
            }
            return  Object.freeze ? Object.freeze(Base) : Base;
        }
    });

})(base);

(function(X) {

    X.mix(X, {
        module: {},
        addModule: function (moduleName, value) {
            if (moduleName && typeof moduleName === 'string') {
                X.register(moduleName, value);
            }
        },
        use: function (moduleName, callback, arg) {
            var moduleObj = X.getModule(moduleName);
            if (moduleObj)
                moduleObj.call(moduleObj, moduleObj, X.global, arg);
            if (callback)
                X.ready(function () {
                    callback.call(moduleObj, moduleObj, X.global, arg);
                });
        },
        register: function (ns, value) {
            if (!ns || !ns.length) {
                return null;
            }
            var levels = ns.split(".");
            var nsobj = X.module;
            var returnObj = null;
            for (var i = 0; i < levels.length; ++i) {
                nsobj[levels[i]] = nsobj[levels[i]] || {};
                if (i == (levels.length - 1)) {
                    nsobj[levels[i]] = value;
                }
                returnObj = nsobj;
                nsobj = nsobj[levels[i]];
            }
            return returnObj;
        },
        getModule: function (ns) {
            if (!ns || !ns.length) {
                return null;
            }
            try {
                return eval('base.module.' + ns);
            } catch (e) {

            }
        },
        /**
         * @desc 获取单例
         */
        getInstance: function (obj, arg) {
            if (X.cache(obj, 'instance')) {
                X.cache(obj, 'instance').constructor(arg);
                return X.cache(obj, 'instance');
            } else {
                var objInstance = new obj(arg);
                X.cache(obj, 'instance', objInstance);
                return objInstance;
            }
        }
    });

})(base);

(function(X, $) {
    var emptyFn = function () {},
        slice = Array.prototype.slice,
        widgetBase = X.create({
            statics: {
                name: 'widgetBase'
            },
            init: function () {
                this.options = {};
                this.element = {};
            },
            _setElement: function (element) {
                this.element = element;
            },
            _getElement: function() {
                return this.element;
            },
            _setOption: function (options) {
                X.mix(this.options, options, true);
            },
            _getOption: function () {
                return this.options;
            },
            _factory: function (method, args) {
                this[method].apply(this, args);
            },
            _destroy: emptyFn,
            _create: emptyFn,
            _init: emptyFn
        });
    X.mix(X, {
        parseTpl: function (str, data) {
            var tmpl = 'var __p=[];' + 'with(obj||{}){__p.push(\'' +
                    str.replace(/\\/g, '\\\\')
                        .replace(/'/g, '\\\'')
                        .replace(/<%=([\s\S]+?)%>/g, function(match, code) {
                            return '\',' + code.replace(/\\'/, '\'') + ',\'';
                        })
                        .replace(/<%([\s\S]+?)%>/g, function(match, code) {
                            return '\');' + code.replace(/\\'/, '\'')
                                    .replace(/[\r\n\t]/g, ' ') + '__p.push(\'';
                        })
                        .replace(/\r/g, '\\r')
                        .replace(/\n/g, '\\n')
                        .replace(/\t/g, '\\t') +
                    '\');}return __p.join("");',
            /* jsbint evil:true */
                func = new Function('obj', tmpl);
            return data ? func(data) : func;
        },
        widget: function (uiName, obj, protos) {
            var protoClass;
            if (protos && X.isFunction(protos)) {
                protoClass = X.create(protos, obj);
            } else {
                protoClass = X.create(widgetBase, obj);
            }
            X.addModule(uiName, protoClass);
            X.zeptoFn(uiName, protoClass);
        },
        zeptoFn: function (uiName, protoClass) {

            var key = uiName.substring(0, 1).toLowerCase() + uiName.substring(1),
                old = $.fn[ key ];

            if (key.indexOf('ui.') > -1) {
                key = key.replace('ui.', '');
            }

            $.fn[ key ] = function (opts) {
                var args = slice.call(arguments, 1),
                    method = typeof opts === 'string' && opts,
                    ret,
                    obj;
                $.each(this, function(i, el) {
                    // 从缓存中取，没有则创建一个
                    if ($(this).data(key)) {
                        obj = $(this).data(key);
                        obj._setOption(opts);
                        obj.element = this;
                        obj._create(opts);
                    } else {
                        obj = new protoClass(opts);
                        obj.element = this;
                        obj._setOption(opts);
                        obj._init(opts);
                        obj._create(opts);
                        $(this).data(key, obj);
                    }

                    // 取实例
                    if (method === 'this') {
                        ret = obj;
                        return false;    // 断开each循环
                    } else if (method) {
                        // 当取的方法不存在时，抛出错误信息
                        obj._factory(method, args);

                        // 断定它是getter性质的方法，所以需要断开each循环，把结果返回
                        if (ret !== undefined && ret !== obj) {
                            return false;
                        }
                        // ret为obj时为无效值，为了不影响后面的返回
                        ret = undefined;
                    }
                });
                return ret !== undefined ? ret : this;
            };
            $.fn[ key ].noConflict = function() {
                $.fn[ key ] = old;
                return this;
            };
        }
    });
})(base, $);
/**
 * Created by skyang on 15/7/28.
 */
