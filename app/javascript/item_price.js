function domFinished(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = inputValue/10
     const addProfitDom = document.getElementById("profit");
     addProfitDom.innerHTML = inputValue*9/10
  })
}
document.addEventListener('DOMContentLoaded', domFinished);
