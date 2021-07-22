module.exports = (id, position) => ({
  id,
  claims: {
    P39: {
      value: position,
      qualifiers: {
        P580: '2018-05-18',
        P5054: 'Q52225870' // Fourth Orban Cabinet
      },
      // references will be added separately with named as/stated as etc
    }
  }
})
