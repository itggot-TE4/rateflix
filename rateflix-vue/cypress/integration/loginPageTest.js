describe('Login page', () => {
  it('shows error with empty credentials', () => {
    cy.visit('http://localhost:8080/login')

    cy.get('[data-cy=login]').click();

    cy.contains('need to sign in')
  })
})
