// Generated by CoffeeScript 1.6.2
(function() {
  var $, chai, expect, mouseevents;

  if (this.require == null) {
    chai = require('chai');
    $ = require('jquery');
  }

  expect = chai.expect;

  mouseevents = ['click', 'dblclick', 'focusout', 'hover', 'mousedown', 'mouseenter', 'mousemove', 'mouseout', 'mouseover', 'mouseup'];

  describe('$.enabled', function() {
    it('is implemented', function() {
      expect($.fn.enabled).to.exist;
      return expect(typeof $.fn.enabled).to.equal('function');
    });
    it('should be true by default', function() {
      return expect($('<div>').enabled()).to.be["true"];
    });
    it('should be true when set true', function() {
      return expect($('<div>').enabled(true).enabled()).to.be["true"];
    });
    it('should be false when set false', function() {
      return expect($('<div>').enabled(false).enabled()).to.be["false"];
    });
    it('can access with $.fn.data()', function() {
      expect($('<div>').data('enabled')).to.be.undefined;
      expect($('<div>').enabled(true).data('enabled')).to.be["true"];
      return expect($('<div>').enabled(false).data('enabled')).to.be["false"];
    });
    return it('can stop fire mouse event', function(done) {
      var counter;

      counter = 0;
      $('<div>').on('click', function() {
        return counter++;
      }).trigger('click').enabled(false).trigger('click');
      return setTimeout(function() {
        expect(counter).below(2);
        return done();
      }, 0);
    });
  });

}).call(this);

/*
//@ sourceMappingURL=test.jquery.enabled.map
*/
