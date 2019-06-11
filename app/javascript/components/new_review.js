const reviewShow = () => {
  const reviewSubmit = document.querySelector('#new_review');
  const activityReviewForm = document.querySelector('.activity-review-form');
  const placeReviewForm = document.querySelector('.place-review-form');
  if (reviewSubmit != null) {
    reviewSubmit.addEventListener('click', (e) => {
      e.preventDefault();

      if (placeReviewForm == null) {
        activityReviewForm.classList.toggle('hide-form');
      } else {
        placeReviewForm.classList.toggle('hide-form');
      }
    });
  }
}

export { reviewShow };
