window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor( priceInput.value * 0.1);
  const addDom = document.getElementById("profit");
  addDom.innerHTML = Math.floor( priceInput.value  - addTaxDom.innerHTML );
  })
})