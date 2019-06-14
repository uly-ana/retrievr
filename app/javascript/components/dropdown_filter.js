const downFilter = document.querySelector('.filter');
const dropdownContent = document.querySelector('.dropdown-content');
const filterContent = document.querySelector('.filter-dropdown');

const dropdownFilter = () => {
  if (downFilter != null) {
    downFilter.addEventListener('click', (e) => {
      e.preventDefault();

      // filterContent.style.boxShadow = '0 0 15px rgba(0, 0, 0, .2)';
      dropdownContent.classList.toggle('dropdown-hide');
    });
  }
}

export { dropdownFilter };
