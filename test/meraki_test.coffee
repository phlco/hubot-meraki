chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'meraki', ->
  beforeEach ->
    @robot = {}

    require('../src/meraki')(@robot)

  it 'does something', ->
