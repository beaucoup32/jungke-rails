describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it('checks if prodicts loads on hompage', () => {
    cy.get('.products').children()
    cy.get(".products article").should("be.visible");
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})