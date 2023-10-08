
window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    const taxAmount = inputValue * 0.10;
    addTaxDom.innerHTML = Math.floor(taxAmount);
    console.log(addTaxDom.innerHTML);

    const salesProfit = document.getElementById("profit");
    const profitAmount = inputValue - taxAmount;
    salesProfit.innerHTML = Math.floor(profitAmount);
    console.log(salesProfit.innerHTML);
  })
});