function profit(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");

  itemPrice.addEventListener("keyup", function(){
    let price = itemPrice.value;
    addTaxPrice.textContent = Math.round(price * 0.1);
    Profit.textContent = (price - addTaxPrice.textContent);
  });
};
window.addEventListener("load", profit);