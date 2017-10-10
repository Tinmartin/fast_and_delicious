const btns = document.querySelectorAll('.favorite');
btns.forEach((btn) => {
  btn.addEventListener('click', (event) => {
  // si document.querySelector('.favorite').attributes[3].value == "post"
      const span = btn.querySelector('span');
      console.log(span);
      span.classList.toggle('fa-heart');
      span.classList.toggle('fa-heart-o');
   // sinon
  });
});
