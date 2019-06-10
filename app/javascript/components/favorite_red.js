const redOnClick = () => {
  const favoriteBtns = document.querySelectorAll('.btn-reds');
  favoriteBtns.forEach((btn) => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      btn.classList.toggle('btn-red');
      btn.style.transition = 'all 1s ease';
    });
  });
}

export { redOnClick };
