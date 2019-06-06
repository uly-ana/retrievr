import "bootstrap";

const downFilter = document.querySelector('.dropdown-filter');
const dropdownContent = document.querySelector('.dropdown-content');

downFilter.addEventListener('click', (e) => {
  e.preventDefault();

  dropdownContent.classList.toggle('dropdown-hide');
});
