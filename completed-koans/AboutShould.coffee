should = require('chai').should() # import Chai.js matchers
FILL_ME_IN = 'Fill this value in' # Don't touch this one!

describe 'About Should', ->
  # We shall contemplate truth by testing reality
  it 'should expect true', ->
    (1 is 1).should.be.true
    # The first part (FILL_ME_IN) should be 'true'
    # Note absence of () at the end - true is not a function

  it 'should have filled in values', ->
    2.should.equal 1 + 1
    # Note absence of parentheses around the addition
    # equal(toValue) is a function but brackets are optional

  it 'should understand type coercion is fixed', ->
    # The 'is' is the same as Javascript's === operator
    (0 is '0').should.be.false # unlike JavaScript's ==
    true.should.be.true

  # To understand reality, we must compare our expectations against reality.
  it 'should expect equality', ->
    expectedValue = 2
    actualValue = 1 + 1
    (expectedValue == actualValue).should.be.true
    # == is the same as 'is' i.e. JavaScript's === operator

  # Some ways of asserting equality are better than others.
  it 'should assert equality a better way', ->
    expectedValue = 2
    actualValue = 1 + 1
    # Chai's equal() function works like ===
    actualValue.should.equal expectedValue

