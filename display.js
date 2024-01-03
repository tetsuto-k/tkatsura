fetch('popup.html')
    .then(response => response.text())
    .then(content => {
        const parser = new DOMParser();
        const popupDoc = parser.parseFromString(content, 'text/html');
        const moveToIndex = popupDoc.getElementById('moveToIndex').innerHTML;

        document.getElementById('displayText').innerText = moveToIndex;
    })
    .catch(error => console.error('Error fetching content:', error));