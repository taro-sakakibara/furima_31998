
function math(){
  console.log("ok")
  const inputPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  const sellsProfit = document.getElementById("profit")
    inputPrice.addEventListener('input', function() {
      const values = inputPrice.value
      tax_value = parseInt(values * 0.1, 10)
      profit_value = values - tax_value
      
      taxPrice.innerHTML = tax_value
      sellsProfit.innerHTML =  profit_value
   })
  }

  window.addEventListener('load', math)
