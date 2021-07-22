// wb ar add-source-name.js Q97131330-4C4A7FD7-C10F-4D38-B5FD-03F6EADF409A "Vassilios Demetriades" "Deputy Minister of Shipping"

module.exports = (guid, name, position) => ({
    guid,
    snaks: {
      P854: 'https://kormany.hu/a-kormany-tagjai',
      P1476: {
        text: 'A KORMÁNY TAGJAI',
        language: 'hu',
      },
      P813: new Date().toISOString().split('T')[0],
      P407: 'Q9067', // language: Hungarian
      P1810: name, // named as (Person)
      P1932: position, //stated as (Position)
    }
})
