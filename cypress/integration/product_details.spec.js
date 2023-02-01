describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("Redirects to product page when clicking on product", () => {

    cy.get('article').first().click()
    cy.url().should('include', '/products/2')
  })
})