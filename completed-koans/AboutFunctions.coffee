should = require('chai').should() # import Chai.js matchers
FILL_ME_IN = 'Fill this value in'

describe 'About Functions', ->
  it 'should declare functions', ->
    # In Coffeescript, the value of the last expression evaluated
    # is by default the return value of the function, this enables
    # us to write very concise function definitions
    add = (a, b) -> a + b
    add(1, 2).should.equal 3

  it 'should know internal variables override outer variables', ->
    message = 'Outer'
    getMessage = -> message
    overrideMessage = -> message = 'Inner'

    getMessage().should.equal 'Outer'
    overrideMessage().should.equal 'Inner'
    message.should.equal 'Inner'

  it 'should have lexical scoping', ->
    variable = 'top-level'
    parentfunction = ->
      variable = 'local'
      childfunction = -> variable

    parentfunction()().should.equal 'local'

  it 'should use lexical scoping to synthesise functions', ->
  # This is a form of partial application
    makeIncreaseByFunction = (increaseByAmount) ->
      (numberToIncrease) -> numberToIncrease + increaseByAmount

    increaseBy3 = makeIncreaseByFunction 3
    increaseBy5 = makeIncreaseByFunction 5

    (increaseBy3(10) + increaseBy5(10)).should.equal 28

  it 'should allow extra function arguments', ->
    returnFirstArg = (firstArg) -> firstArg
    result = returnFirstArg('first', 'second', 'third')
    result.should.equal 'first'

    returnSecondArg = (firstArg, secondArg) -> secondArg
    result = returnSecondArg('only give first arg')
    should.not.exist result
    # x.should.not.exist gives an error, should.not.exist x doesn't

  it 'should allow splats', ->
    returnAllArgs = (allargs...) -> allargs
    result = returnAllArgs('first', 'second', 'third')
    result.should.deep.equal ['first', 'second', 'third']

    returnAllButFirst = (firstArg, rest...) -> rest
    result = returnAllButFirst('first', 'second', 'third')
    result.should.deep.equal ['second', 'third']

  it 'should pass functions as values', ->
    appendRules = (name) -> name + ' rules!'
    appendDoubleRules = (name) -> name + ' totally rules!'

    praiseSinger = givePraise: appendRules # Note: Object literal
    praiseSinger.givePraise('John').should.equal 'John rules!'

    praiseSinger.givePraise = appendDoubleRules
    praiseSinger.givePraise('Mary').should.equal 'Mary totally rules!'

  # If only
  it 'should understand destructuring assignment', ->
    weatherReport = (location) -> [location, 22, 'Mostly sunny']
    [city, temperature, forecast] = weatherReport 'London'
    city.should.equal 'London'
    temperature.should.equal 22

  # I always do what I'm told
  it 'should understand destructuring works with splats', ->
    phrase = 'Now is the time for all good men to come to the aid of the Party'
    [start, middle..., end] = phrase.split ' '
    start.should.equal 'Now'
    end.should.equal 'Party'
