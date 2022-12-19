document.addEventListener("turbo:load", function() {
  let check = document.getElementById('address_use_billing')
  let checkbox = document.getElementById('use-billing')
  let shipping_form = document.getElementById('shipping')
  let shipping_title = document.getElementById('shipping-title')

  checkbox.addEventListener('click', ()=>{
    console.log(shipping_title)
    check.value = true
    shipping_form.style.visibility = 'hidden'
    shipping_title.style.visibility = 'hidden'
  })
});
