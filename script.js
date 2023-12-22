// script.js

function showPopup(htmlFileName) {
    // Get the popup container
    const popupContainer = document.getElementById("popupContainer");
    const overlayBackground = document.getElementById("overlayBackground");

    // Load content from the external HTML file
    fetch(htmlFileName)
        .then(response => response.text())
        .then(content => {
            // Set the content inside the popup container
            popupContainer.innerHTML = content;

            // Show the popup
            console.log("Nothing visible yet");
            popupContainer.style.visibility = "visible";
            setTimeout(function () {
                popupContainer.classList.add("active");
              }, 100);
            console.log("just set timeout for first");
            // Block everything in the main website
            overlayBackground.style.visibility = "visible";
            console.log("2nd is visible");
            setTimeout(function () {
                overlayBackground.classList.add("active");
                console.log("time out 2nd");
              }, 100);
        });
}

function hidePopup() {
    // Hide the popup
    document.getElementById("popupContainer").classList.remove("active");
    document.getElementById("overlayBackground").classList.remove("active");
    
    setTimeout(function () {
        document.getElementById("popupContainer").style.visibility = "hidden";
        document.getElementById("overlayBackground").style.visibility = "hidden";
      }, 900);
}
