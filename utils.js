function decodeHtmlEntities(str) {
    let textarea = document.createElement("textarea");
    textarea.innerHTML = str;
    return textarea.value;
}
