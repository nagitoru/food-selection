window.addEventListener("load", (e) => {
  const itemLimit = document.getElementById("item-limit");
  itemLimit.addEventListener("click", (e) => {
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/limit`, true);
    XHR.responseType = "json";
    XHR.send
    XHR.onload = () => {
      const item = XHR.response.post;
      item.setAttribute("item-limit-list");
    }
  });
})