describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("Redirects to product page when clicking on product", () => {

    cy.get('.nav-link').contains('My Cart (0)')
    cy.get('article').first().contains('Add').click({force: true})
    cy.get('.nav-link').contains('My Cart (1)')
  })
})