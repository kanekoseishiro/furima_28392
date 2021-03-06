const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  console.log(process.env.PAYJP_PUBLIC_KEY)
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    console.log(e)
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_address[card_number]"),
      cvc: formData.get("purchase_address[card_cvc]"),
      exp_month: formData.get("purchase_address[card_exp_month]"),
      exp_year: `20${formData.get("purchase_address[card_exp_year]")}`,
    };
    console.log(card)
    
    Payjp.createToken(card, (status, response) => {
      console.log(status)
      if (status === 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card_number").removeAttribute("name");
        document.getElementById("card_cvc").removeAttribute("name");
        document.getElementById("card_exp_month").removeAttribute("name");
        document.getElementById("card_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        document.getElementById("card_number").removeAttribute("name");
        document.getElementById("card_cvc").removeAttribute("name");
        document.getElementById("card_exp_month").removeAttribute("name");
        document.getElementById("card_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }
    });
  });
};

window.addEventListener("load", pay);