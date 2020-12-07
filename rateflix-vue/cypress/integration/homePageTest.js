describe('My First Test', () => {
  it('finds the content "Home"', () => {
    cy.visit('http://localhost:8080')

    cy.contains('Home')
  })
})
