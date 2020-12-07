// import { Controller } from "stimulus"

// export default class extends Controller {
//   static targets = [ "assign" ]

//   connect() {
//     // this.outputTarget.textContent = 'Hello, Stimulus!'
//   }

//   trigger = (event) => {
//     const form = document.querySelector('#assign_form');
//     console.log(form);
//     event.preventDefault();
//     fetch(form.action, {method:'patch', body: new FormData(form), headers: { accept: "application/json" }})
//       .then(response => response.json())
//       .then((data) => {
//         swal({
//           title: "Success",
//           text: "Your dates were successfully created",
//           icon: "success",}).then((value) => {
//             window.location.pathname = '/dashboard'
//           });
//       });
//   };
// }
