// wd create-entity create-office.js "Minister for X"
module.exports = (label) => {
  return {
    type: 'item',
    labels: {
      en: label,
    },
    descriptions: {
      en: 'Hungarian Cabinet position',
    },
    claims: {
      P31:   { value: 'Q294414' }, // instance of: public office
      P279:  { value: 'Q83307'  }, // subclas of: minister
      P17:   { value: 'Q28'     }, // country: Hungary
      P1001: { value: 'Q28'     }, // jurisdiction: Hungary
      P361: {                      // part of: Government of Hungary
        value: 'Q1162751',
        references: {
          P854: 'https://kormany.hu/a-kormany-tagjai',
        },
      }
    }
  }
}
