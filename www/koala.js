var noop = function(){};
var koala = {
    do:function(content,scbf,ecbf){
        cordova.exec(scbf || noop,ecbf || noop,"KoalaPlugin","do",[content,str]);
    }
};
module.exports = koala;

