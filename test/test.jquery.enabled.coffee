{expect} = chai

mouseevents = [
  'click', 'dblclick', 'focusout', 'hover',
  'mousedown', 'mouseenter', 'mousemove', 'mouseout', 'mouseover', 'mouseup'
]

describe '$.enabled', ->

  it 'is implemented', ->
    expect($.fn.enabled).to.exist
    expect(typeof $.fn.enabled).to.equal 'function'

  it 'should be true by default', ->
    expect($('<div>').enabled()).to.be.true

  it 'should be true when set true', ->
    expect($('<div>').enabled(true).enabled()).to.be.true

  it 'should be false when set false', ->
    expect($('<div>').enabled(false).enabled()).to.be.false

  it 'can access with $.fn.data()', ->
    expect($('<div>').data('enabled')).to.be.undefined
    expect($('<div>').enabled(true).data('enabled')).to.be.true
    expect($('<div>').enabled(false).data('enabled')).to.be.false

  it 'can stop fire mouse event', (done) ->
    counter = 0
    $('<div>')
      .on 'click', ->
        counter++
      .trigger('click')
      .enabled(false)
      .trigger('click')
    setTimeout ->
      expect(counter).below(2)
      done()
    , 0

