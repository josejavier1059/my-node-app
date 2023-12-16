const calc = require('./calc');
const expect = require('chai').expect;

describe('Calc', function() {
  it('should add two numbers correctly', function() {
    expect(calc.add(2, 3)).to.equal(5);
  });
});

