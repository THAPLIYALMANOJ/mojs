mix = mojs.easing.mix

describe 'mix ->', ->
  it 'should return new function', ->
    res = mix({to: .5, value: 4})
    expect(typeof res).toBe 'function'

describe 'returned function ->', ->
  it 'should return value on the progress', ->
    res = mix({to: .5, value: 4}, {to: .7, value: 3})
    expect(res(.4)).toBe 4
    expect(res(.6)).toBe 3
  it 'should evaluate function if passed', ->
    res = mix({to: .5, value: (p)-> return 2*p }, {to: .7, value: 3})
    expect(res(.4)).toBe 2*.4
    expect(res(.6)).toBe 3
  it 'should return 1 if not defined', ->
    res = mix({to: .5, value: (p)-> return 2*p })
    expect(res(.6)).toBe 1
