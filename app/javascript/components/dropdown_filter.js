const downFilter = document.querySelector('.filter');
const dropdownContent = document.querySelector('.dropdown-content');

const dropdownFilter = () => {
  if (downFilter != null) {
    downFilter.addEventListener('click', (e) => {
      e.preventDefault();

      dropdownContent.classList.toggle('dropdown-hide');
    });
  }
}

export { dropdownFilter };
