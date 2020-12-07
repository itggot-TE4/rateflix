describe('Login page', () => {
  it('shows error with empty credentials', () => {
    cy.visit('http://localhost:8080/login')

    cy.contains('Login').click()
  })
})
