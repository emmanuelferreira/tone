import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


flatpickr("#check_in_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#check_out_date" })],
});

const dateValidation = () => {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

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