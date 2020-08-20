import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('instrument_pickup_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
