// Generated by CoffeeScript 1.6.3
(function() {
  var VAT;

  VAT = 1.14;

  Array.prototype.remove = function(e) {
    var t;
    if ((t = this.indexOf(e)) > -1) {
      return this.splice(t, 1);
    }
  };

  console.log("favourite thing");

  window.ModelObject = (function() {
    function ModelObject() {}

    ModelObject.prototype.getByID = function(id) {
      var _this = this;
      this._busy = true;
      return $.get('/api/get_by_id/', {
        model: this.model,
        id: id
      }).then(function(data, status, headers, config) {
        _this._busy = false;
        if (data.status === 0) {
          return _this.constructor(data.data);
        } else {
          return _this.constructor({});
        }
      });
    };

    return ModelObject;

  })();

}).call(this);
