import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#check_in_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#check_out_date"})]
});


