const reviewShow = () => {
  const reviewSubmit = document.querySelector('#new_review');
  const reviewForm = document.querySelector('.activity-review-form');


  if (reviewSubmit != null) {
    reviewSubmit.addEventListener('click', (e) => {
      e.preventDefault();

      reviewForm.classList.toggle('hide-form');
    });
  }
}

export { reviewShow };
