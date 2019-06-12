import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('place_location');

  if (addressInput != null) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };