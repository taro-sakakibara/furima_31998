const pay = () => {
  Payjp.setPublicKey("pk_test_b6ffa0fbefe6f2e7541d48c0");
  const form = document.getElementById("credit-card-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("credit-card-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
  };

  Payjp.createToken(card, (status, response) => {
    if (status == 200) {
      const token = response.id;
      const renderDom = document.getElementById("credit-card-form");
      const tokenObj = `<input value=${token} name='token' type="hidden"> `;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
    }

    document.getElementById("order_number").removeAttribute("name");
    document.getElementById("order_cvc").removeAttribute("name");
    document.getElementById("order_exp_month").removeAttribute("name");
    document.getElementById("order_exp_year").removeAttribute("name");

    document.getElementById("charge-form").submit();
  });
  });
};

window.addEventListener("load", pay);