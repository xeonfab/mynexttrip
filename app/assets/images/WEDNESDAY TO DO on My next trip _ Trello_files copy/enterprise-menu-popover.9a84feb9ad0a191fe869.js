(window.webpackJsonp=window.webpackJsonp||[]).push([[21],{5431:function(e,t,n){var r=n(5432);"string"==typeof r&&(r=[[e.i,r,""]]);var o={hmr:!0,transform:void 0,insertInto:void 0};n(21)(r,o);r.locals&&(e.exports=r.locals)},5432:function(e,t,n){(t=e.exports=n(20)(!1)).push([e.i,".-lGl2yEhqfdGTe{margin:0 -12px}",""]),t.locals={popoverMenu:"-lGl2yEhqfdGTe"}},5526:function(e,t,n){"use strict";n.r(t);var r=n(982),o=n(47),i=n(442),c=n(5),a=n(0),u=n.n(a),p=n(5431),s=n.n(p),f=n(76);function l(e){return(l="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e})(e)}function y(e,t){for(var n=0;n<t.length;n++){var r=t[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(e,r.key,r)}}function b(e,t){return!t||"object"!==l(t)&&"function"!=typeof t?function(e){if(void 0===e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return e}(e):t}function m(e){return(m=Object.setPrototypeOf?Object.getPrototypeOf:function(e){return e.__proto__||Object.getPrototypeOf(e)})(e)}function d(e,t){return(d=Object.setPrototypeOf||function(e,t){return e.__proto__=t,e})(e,t)}var h=Object(c.forTemplate)("header_enterprise_admin_dashboard_menu"),v=function(e){function t(){return function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,t),b(this,m(t).apply(this,arguments))}var n,r,o;return function(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function");e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,writable:!0,configurable:!0}}),t&&d(e,t)}(t,u.a.Component),n=t,(r=[{key:"componentDidMount",value:function(){this.props.fetchEnterprises()}},{key:"render",value:function(){var e=this,t=this.props,n=t.isLoading,r=t.enterprises;return n?u.a.createElement("div",null,h("loading")):0===r.length?u.a.createElement("div",null,h("no-enterprises")):u.a.createElement(f.a,{className:s.a.popoverMenu},r.map(function(t){return u.a.createElement(f.c,{key:"enterprise-".concat(t.id),href:"/e/".concat(t.name,"/admin"),onClick:function(){return e.props.onEnterpriseSelected(t.name)}},t.displayName)}))}}])&&y(n.prototype,r),o&&y(n,o),t}();t.default=Object(o.c)(function(e){return{isLoading:Object(i.g)(e),enterprises:Object(i.a)(e)}},function(e){return{fetchEnterprises:function(){e(Object(r.b)())}}})(v)}}]);
//# sourceMappingURL=enterprise-menu-popover.9a84feb9ad0a191fe869.js.map