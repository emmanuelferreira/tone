import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


const dateValidation = () => {
  const startDateInput = document.getElementById('check_in_date');
  const endDateInput = document.getElementById('check_out_date');

  if (startDateInput) {
    const unavailableDates = JSON.parse(document.querySelector('#instrument-booking-dates').dataset.unavailable)
    endDateInput.disabled = true

    flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "Y-m-d",
    });

    console.log('im in the file')

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        disable: unavailableDates,
        dateFormat: "Y-m-d"
      });
    })
  };
};

export { dateValidation };
