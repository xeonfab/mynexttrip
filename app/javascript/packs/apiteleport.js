// define the url
// fetch url
//

const url =`https://api.teleport.org/api/urban_areas/`;

fetch(url)
    .then(response => response.json())
    .then((data) => {
      data.forEach((element) => {
        const info = `<li>${element.href} posted by ${element.name}</li>`;
        list.insertAdjacentHTML("afterbegin", info);
        console.log(element)
      });
});


fetch("http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7")
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });
